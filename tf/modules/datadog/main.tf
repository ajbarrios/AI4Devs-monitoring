# Archivo: tf/modules/datadog/main.tf

# Proveedores requeridos por el módulo (se configurarán en el raíz)
terraform {
  required_providers {
    aws     = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    datadog = {
      source  = "DataDog/datadog"
      version = "~> 3.0"
    }
  }
}

# --- Recursos IAM para la Integración de Datadog ---
resource "aws_iam_role" "datadog_integration_role" {
  name               = var.role_name
  assume_role_policy = jsonencode({
    Version   = "2012-10-17",
    Statement = [
      {
        Effect    = "Allow",
        Principal = {
          AWS = "arn:aws:iam::${var.datadog_aws_account_id}:root"
        },
        Action    = "sts:AssumeRole",
        Condition = {
          StringEquals = {
            "sts:ExternalId" = var.external_id
          }
        }
      }
    ]
  })
  tags               = merge(var.tags, {
    Name = var.role_name
  })
}

resource "aws_iam_role_policy_attachment" "datadog_integration_policy_attachment" {
  role       = aws_iam_role.datadog_integration_role.name
  policy_arn = "arn:aws:iam::aws:policy/DatadogAWSIntegrationPolicy"
}


# --- Recursos Datadog ---

# Configuración de la integración de Datadog con AWS
resource "datadog_integration_aws" "aws_integration" {
  account_id = var.aws_account_id_for_integration
  role_name  = aws_iam_role.datadog_integration_role.name
  # filter_tags = var.filter_tags # Descomentar si se añade la variable
  # host_tags   = var.host_tags   # Descomentar si se añade la variable
  # Opcional: añadir más configuraciones como cloudwatch_namespace_exclusions, etc.
}

# Creación de un dashboard básico en Datadog
resource "datadog_dashboard" "overview_dashboard" {
  title        = var.dashboard_name
  description  = var.dashboard_description
  layout_type  = "ordered"
  is_read_only = true # Terraform gestionará los cambios

  dynamic "widget" {
    for_each = var.ec2_cpu_widget_enabled ? [1] : []
    content {
      definition {
        timeseries_definition {
          title        = "EC2 CPU Utilization (%)"
          show_legend  = true
          request {
            q            = "avg:aws.ec2.cpuutilization{*} by {host}"
            display_type = "line"
          }
        }
        type = "timeseries"
      }
    }
  }

  dynamic "widget" {
    for_each = var.ec2_network_widget_enabled ? [1] : []
    content {
      definition {
        timeseries_definition {
          title        = "EC2 Network I/O (Bytes)"
          show_legend  = true
          request {
            q            = "avg:aws.ec2.network_in{*} by {host}, avg:aws.ec2.network_out{*} by {host}"
            display_type = "line"
          }
        }
        type = "timeseries"
      }
    }
  }

  dynamic "widget" {
    for_each = var.rds_cpu_widget_enabled ? [1] : []
    content {
      definition {
        timeseries_definition {
          title        = "RDS CPU Utilization (%)"
          show_legend  = true
          request {
            q            = "avg:aws.rds.cpuutilization{*} by {dbinstanceidentifier}"
            display_type = "line"
          }
        }
        type = "timeseries"
      }
    }
  }

  dynamic "widget" {
    for_each = var.s3_bucket_size_widget_enabled ? [1] : []
    content {
      definition {
        timeseries_definition {
          title        = "S3 Bucket Size (Bytes) - StandardStorage"
          show_legend  = true
          request {
            q            = "max:aws.s3.bucket_size_bytes{storageclass:standardstorage} by {bucketname}" 
            display_type = "bars"
          }
        }
        type = "timeseries"
      }
    }
  }

  template_variable {
    name    = "host"
    prefix  = "host"
    default = "*"
  }

  template_variable {
    name    = "dbinstanceidentifier"
    prefix  = "dbinstanceidentifier"
    default = "*"
    # Solo mostrar si el widget RDS está habilitado (requeriría una lógica más compleja o dejarlo siempre)
  }

  template_variable {
    name    = "bucketname"
    prefix  = "bucketname"
    default = "*"
    # Solo mostrar si el widget S3 está habilitado (requeriría una lógica más compleja o dejarlo siempre)
  }
} 