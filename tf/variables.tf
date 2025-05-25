variable "aws_region" {
  description = "Región de AWS para desplegar los recursos."
  type        = string
  default     = "us-east-1"
}

variable "datadog_api_key" {
  description = "Clave API de Datadog. Debe ser proporcionada (ej. mediante un archivo .tfvars o variable de entorno)."
  type        = string
  sensitive   = true
}

variable "datadog_app_key" {
  description = "Clave de aplicación de Datadog. Debe ser proporcionada."
  type        = string
  sensitive   = true
}

variable "external_id" {
  description = "External ID para la asunción del rol IAM por Datadog. Se genera en Datadog y debe ser proporcionado."
  type        = string
  sensitive   = true
}
