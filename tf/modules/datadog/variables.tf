variable "aws_region" {
  description = "Región de AWS donde se crearán los recursos de IAM y se integrará Datadog."
  type        = string
}

variable "datadog_api_key" {
  description = "Clave API de Datadog."
  type        = string
  sensitive   = true
}

variable "datadog_app_key" {
  description = "Clave de aplicación de Datadog."
  type        = string
  sensitive   = true
}

variable "datadog_aws_account_id" {
  description = "ID de la cuenta de AWS de Datadog para la política de confianza del rol IAM."
  type        = string
  default     = "464622532012" # Valor común proporcionado por Datadog
}

variable "external_id" {
  description = "External ID para la asunción del rol IAM por Datadog. Se genera en Datadog."
  type        = string
  sensitive   = true
}

variable "role_name" {
  description = "Nombre para el rol IAM de integración de Datadog."
  type        = string
  default     = "DatadogIntegrationRole"
}

variable "policy_name_prefix" {
  description = "Prefijo para el nombre de la política IAM si se creara una personalizada (no usado si se usa política administrada)."
  type        = string
  default     = "DatadogIntegrationPolicy"
}

variable "dashboard_name" {
  description = "Nombre para el dashboard de Datadog."
  type        = string
  default     = "LTI Project Overview Dashboard (Terraform Module)"
}

variable "dashboard_description" {
  description = "Descripción para el dashboard de Datadog."
  type        = string
  default     = "Dashboard básico con métricas clave para el proyecto LTI, gestionado por Terraform module."
}

variable "tags" {
  description = "Etiquetas comunes para aplicar a los recursos creados."
  type        = map(string)
  default     = {}
}

variable "aws_account_id_for_integration" {
  description = "ID de la cuenta de AWS del cliente que se está integrando con Datadog."
  type        = string
}

# Variables para personalizar los widgets del dashboard (opcional)
variable "ec2_cpu_widget_enabled" {
  description = "Habilitar widget de utilización de CPU EC2."
  type        = bool
  default     = true
}

variable "ec2_network_widget_enabled" {
  description = "Habilitar widget de E/S de red EC2."
  type        = bool
  default     = true
}

variable "rds_cpu_widget_enabled" {
  description = "Habilitar widget de utilización de CPU RDS."
  type        = bool
  default     = false # Por defecto deshabilitado, ya que RDS puede no estar presente
}

variable "s3_bucket_size_widget_enabled" {
  description = "Habilitar widget de tamaño de bucket S3."
  type        = bool
  default     = false # Por defecto deshabilitado
}

# Puedes añadir más variables para controlar namespaces, filtros, etc.
# variable "filter_tags" {
#   description = "Lista de tags para filtrar recursos en la integración AWS. Ejemplo: ["env:prod"]"
#   type        = list(string)
#   default     = []
# }

# variable "host_tags" {
#   description = "Lista de tags para aplicar a los hosts importados de AWS. Ejemplo: ["project:lti"]"
#   type        = list(string)
#   default     = []
# } 