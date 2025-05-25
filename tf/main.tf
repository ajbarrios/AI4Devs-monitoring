# Archivo: tf/main.tf

# Obtener el ID de la cuenta AWS actual (puede ser útil para configuraciones globales futuras)
# data "aws_caller_identity" "current" {}

# Configuración global de tags o locales (puede ser útil para configuraciones globales futuras)
# locals {
#   common_tags = {
#     Project     = "LTI"
#     ManagedBy   = "Terraform"
#     Environment = "Global"
#   }
# }

# Ya no se llama al módulo Datadog desde la raíz.
# La configuración de Datadog se gestiona por entorno en las carpetas tf/environments/staging y tf/environments/production.
