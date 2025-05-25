# Archivo: tf/modules/datadog/outputs.tf

output "datadog_integration_role_arn" {
  description = "ARN del rol IAM creado para la integración de Datadog."
  value       = aws_iam_role.datadog_integration_role.arn
}

output "datadog_integration_role_name" {
  description = "Nombre del rol IAM creado para la integración de Datadog."
  value       = aws_iam_role.datadog_integration_role.name
}

output "dashboard_url" {
  description = "URL del dashboard de Datadog creado."
  value       = datadog_dashboard.overview_dashboard.url
}

output "dashboard_id" {
  description = "ID del dashboard de Datadog creado."
  value       = datadog_dashboard.overview_dashboard.id
}

output "aws_integration_id" {
  description = "ID de la integración de AWS en Datadog."
  # El recurso datadog_integration_aws no expone directamente un ID simple en todos los casos.
  # Usualmente se identifica por la combinación de account_id y role_name.
  # Si necesitas un ID específico que este recurso pueda devolver, consulta la documentación del proveedor.
  # Por ahora, devolvemos el account_id usado para la integración.
  value       = datadog_integration_aws.aws_integration.account_id
} 