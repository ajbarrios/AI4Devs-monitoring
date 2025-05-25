# Archivo: tf/environments/staging/main.tf

terraform {
  # Backend configuration para el entorno de staging
  # backend "s3" {
  #   bucket         = "lti-terraform-state-staging"
  #   key            = "staging/datadog/terraform.tfstate"
  #   region         = var.aws_region 
  #   encrypt        = true
  # }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    datadog = {
      source  = "DataDog/datadog"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

provider "datadog" {
  api_key = var.datadog_api_key
  app_key = var.datadog_app_key
}

data "aws_caller_identity" "current" {}

locals {
  staging_tags = {
    Project     = "LTI"
    ManagedBy   = "Terraform"
    Environment = var.environment_name
  }
}

module "datadog_monitoring_staging" {
  source = "../../modules/datadog" # Ruta al módulo datadog

  aws_region                   = var.aws_region
  datadog_api_key              = var.datadog_api_key
  datadog_app_key              = var.datadog_app_key
  external_id                  = var.external_id
  aws_account_id_for_integration = data.aws_caller_identity.current.account_id

  role_name          = "DatadogIntegrationRole-StagingLTI"
  dashboard_name     = "LTI Staging Environment Dashboard"
  tags               = local.staging_tags

  # Configuración de widgets para staging (podría ser igual a prod o más limitada)
  ec2_cpu_widget_enabled     = true
  ec2_network_widget_enabled = true
  rds_cpu_widget_enabled     = true
  s3_bucket_size_widget_enabled = true
}

output "staging_dashboard_url" {
  description = "URL del Dashboard de Datadog para el entorno de staging."
  value       = module.datadog_monitoring_staging.dashboard_url
}

output "staging_datadog_integration_role_arn" {
  description = "ARN del Rol IAM para la integración de Datadog en staging."
  value       = module.datadog_monitoring_staging.datadog_integration_role_arn
} 