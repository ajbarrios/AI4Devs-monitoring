Como un ingeniero de DevOps trabajando en el proyecto LTI - Sistema de Seguimiento de Talento, mi tarea es expandir nuestra infraestructura como código existente (basada en Terraform) para implementar un canal de monitorización utilizando Datadog en AWS.

El objetivo es configurar la integración de Datadog con nuestra infraestructura AWS para recopilar métricas, logs y traces, permitiéndonos monitorizar el rendimiento y el estado de nuestros servicios.

Necesito que generes el código Terraform (.tf) necesario para lograr esto dentro de la carpeta `tf`. Pueder editar los archivos existentes o crear otros si es necesario. El código debe:

1.  Configurar la integración básica de Datadog con AWS, incluyendo los permisos IAM necesarios (roles, políticas) para que Datadog pueda acceder a los servicios de AWS relevantes (EC2, RDS, S3, etc., asumiendo que son los servicios comunes que queremos monitorizar).
2.  Utilizar el proveedor de Datadog para configurar recursos básicos de monitorización, como la integración de la cuenta AWS. Hay que generar un dashboard sencillo con las métricas más útiles.
3.  Estar bien estructurado, modularizado (usando módulos si es apropiado) y seguir las mejores prácticas de Terraform.
4.  Incluir variables de Terraform para configurar aspectos como las claves de API y de aplicación de Datadog, la región de AWS, etc.

Considera los requisitos típicos para la integración de Datadog con AWS mediante Terraform. Genera los archivos `.tf` necesarios con el código completo listo para ser aplicado.