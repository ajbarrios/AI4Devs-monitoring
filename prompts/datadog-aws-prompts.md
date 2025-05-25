**Meta-prompt 0 usando Cursor + Gemini 2.5 Pro**
Actua como un devops experto. Elabora un prompt específico en formato markdown para digirir a un agente IA en cursor en la resolución. El a rchivo se llamará `ticket-monitoring.md`.
```
En este ejercicio, ampliaremos nuestro proyecto de infraestructura como código utilizando Terraform para implementar un canal de monitorización de Datadog en AWS. Aprovecharemos técnicas de prompt engineering para automatizar la generación de código, lo que nos permitirá monitorear y obtener insights valiosos de nuestra infraestructura AWS de manera automatizada.

0️⃣ Pre-requisitos:
Cuenta AWS (capa gratuita)
Terraform instalado en tu equipo local
Cuenta Datadog (puedes usar la prueba gratuita)
Repositorio del ejercicio (código Terraform base del ejercicio anterior) el codigo de la clase anterior esta en este repositorio:
🔗 https://github.com/LIDR-academy/AI4Devs-monitoring 
1️⃣ Configuración Inicial:
Asegúrate de tener configuradas tus credenciales de AWS y Datadog en tu entorno local.
Revisa el código Terraform generado en el ejercicio anterior.
Familiarízate con las técnicas de prompt engineering para la generación de código automatizado.
2️⃣ Objetivo del Ejercicio:
Tu misión es extender el código Terraform existente para:

Configurar la integración de Datadog con AWS usando Terraform.
Instalar el agente Datadog en la instancia EC2.
Crear un dashboard en Datadog para visualizar métricas clave de AWS.
3️⃣ Pasos a Seguir:
a) Configurar la Integración AWS-Datadog:
Utiliza Terraform para configurar la integración entre AWS y Datadog, siguiendo la guía proporcionada.
b) Configurar el Proveedor Datadog:
Añade el proveedor Datadog a tu configuración de Terraform.
c) Instalar el Agente Datadog:
Modifica el script de usuario de la instancia EC2 para instalar y configurar el agente Datadog.
d) Crear un Dashboard:
Utiliza Terraform para definir un dashboard en Datadog que muestre métricas relevantes de tu infraestructura AWS.
```

**Prompt 1 usando Cursor + Gemini 2.5 Pro**
Actua como devops experto en AWS, Datadog y Terraform. Escanea el proyecto para obtener el contexto del stack tecnologico del mismo y funcionalides. Listame todo lo que tienes en contexto del proyecto antes de comenzar.

**Prompt 2 usando Cursor + Gemini 2.5 Pro**
Lee el ticket @ticket-monitoring.md y resuelvelo. Pregunta lo que necesites antes de proceder y no cometer alucinaciones.

**Prompt 3 usando Cursor + Gemini 2.5 Pro**
Dentro de la carpeta Tf, hay otras carpetas como environments y modulos que estan vacias. Para realizar buenas prácticas, vamos a refatorizar el codigo existente para que sea mas escalable.

**Prompt 4 usando Cursor + Gemini 2.5 Pro**
En lugar de entorno de dev nuevo, consideremos staging y production. Por favor modifica el paso anterior para que sea compatible solo en esos dos entornos. Hagamos uso de buenas prácticas de despliegue por entornos antes del refactor. Pregunta lo que necesites y ve paso por paso en el refactor.

**Prompt 5 usando Cursor + Gemini 2.5 Pro**
Me quedo con el enfoque 1. Haz los cambios oportunos.

**Prompt 6 usando Cursor + Gemini 2.5 Pro**
Vamos a leer de nuevo lo que hay que resolver en @ticket-monitoring y checkear que hemos resuelto todo lo que se necesita hacer antes de darlo por resuelto.

**Prompt 7 usando Cursor + Gemini 2.5 Pro**
Vamos a leer de nuevo lo que hay que resolver en @ticket-monitoring y checkear que hemos resuelto todo lo que se necesita hacer antes de darlo por resuelto.

**Prompt 8 usando Cursor + Gemini 2.5 Pro**
Actualiza el archivo @README.md del proyecto con las instrucciones de la integración de datadog y el sistema de monitoring. Redactalo de forma que un desarrollador junior sin experiencia sea capaz de entenderlo y ofrecer modificaciones.

**Prompt 9 usando Cursor + Gemini 2.5 Pro**
Actualiza el archivo @README.md del proyecto con las instrucciones de la integración de datadog y el sistema de monitoring. Redactalo de forma que un desarrollador junior sin experiencia sea capaz de entenderlo y ofrecer modificaciones.
