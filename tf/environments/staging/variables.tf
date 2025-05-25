variable "aws_region" {
  description = "Región de AWS para el entorno de staging."
  type        = string
  default     = "us-east-1" # O la región específica para staging
}

variable "datadog_api_key" {
  description = "Clave API de Datadog para el entorno de staging."
  type        = string
  sensitive   = true
}

variable "datadog_app_key" {
  description = "Clave de aplicación de Datadog para el entorno de staging."
  type        = string
  sensitive   = true
}

variable "external_id" {
  description = "External ID de Datadog para el entorno de staging."
  type        = string
  sensitive   = true
}

variable "environment_name" {
  description = "Nombre del entorno actual (ej. staging)."
  type        = string
  default     = "staging"
} 