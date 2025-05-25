# LTI - Sistema de Seguimiento de Talento

Este proyecto es una aplicación full-stack con un frontend en React y un backend en Express usando Prisma como un ORM. El frontend se inicia con Create React App y el backend está escrito en TypeScript.

## Explicación de Directorios y Archivos

- `backend/`: Contiene el código del lado del servidor escrito en Node.js.
  - `src/`: Contiene el código fuente para el backend.
    - `index.ts`: El punto de entrada para el servidor backend.
    - `application/`: Contiene la lógica de aplicación.
    - `domain/`: Contiene la lógica de negocio.
    - `infrastructure/`: Contiene código que se comunica con la base de datos.
    - `presentation/`: Contiene código relacionado con la capa de presentación (como controladores).
    - `routes/`: Contiene las definiciones de rutas para la API.
    - `tests/`: Contiene archivos de prueba.
  - `prisma/`: Contiene el archivo de esquema de Prisma para ORM.
  - `tsconfig.json`: Archivo de configuración de TypeScript.
- `frontend/`: Contiene el código del lado del cliente escrito en React.
  - `src/`: Contiene el código fuente para el frontend.
  - `public/`: Contiene archivos estáticos como el archivo HTML e imágenes.
  - `build/`: Contiene la construcción lista para producción del frontend.
- `.env`: Contiene las variables de entorno.
- `docker-compose.yml`: Contiene la configuración de Docker Compose para gestionar los servicios de tu aplicación.
- `README.md`: Este archivo, contiene información sobre el proyecto e instrucciones sobre cómo ejecutarlo.

## Estructura del Proyecto

El proyecto está dividido en dos directorios principales: `frontend` y `backend`.

### Frontend

El frontend es una aplicación React y sus archivos principales están ubicados en el directorio `src`. El directorio `public` contiene activos estáticos y el directorio `build` contiene la construcción de producción de la aplicación.

### Backend

El backend es una aplicación Express escrita en TypeScript. El directorio `src` contiene el código fuente, dividido en varios subdirectorios:

- `application`: Contiene la lógica de aplicación.
- `domain`: Contiene los modelos de dominio.
- `infrastructure`: Contiene código relacionado con la infraestructura.
- `presentation`: Contiene código relacionado con la capa de presentación.
- `routes`: Contiene las rutas de la aplicación.
- `tests`: Contiene las pruebas de la aplicación.

El directorio `prisma` contiene el esquema de Prisma.

Tienes más información sobre buenas prácticas utilizadas en la [guía de buenas prácticas](./backend/ManifestoBuenasPracticas.md).

Las especificaciones de todos los endpoints de API los tienes en [api-spec.yaml](./backend/api-spec.yaml).

La descripción y diagrama del modelo de datos los tienes en [ModeloDatos.md](./backend/ModeloDatos.md).


## Primeros Pasos

Para comenzar con este proyecto, sigue estos pasos:

1. Clona el repositorio.
2. Instala las dependencias para el frontend y el backend:
```sh
cd frontend
npm install

cd ../backend
npm install
```
3. Construye el servidor backend:
```
cd backend
npm run build
```
4. Inicia el servidor backend:
```
cd backend
npm start
```
5. En una nueva ventana de terminal, construye el servidor frontend:
```
cd frontend
npm run build
```
6. Inicia el servidor frontend:
```
cd frontend
npm start
```

El servidor backend estará corriendo en http://localhost:3010 y el frontend estará disponible en http://localhost:3000.

## Docker y PostgreSQL

Este proyecto usa Docker para ejecutar una base de datos PostgreSQL. Así es cómo ponerlo en marcha:

Instala Docker en tu máquina si aún no lo has hecho. Puedes descargarlo desde aquí.
Navega al directorio raíz del proyecto en tu terminal.
Ejecuta el siguiente comando para iniciar el contenedor Docker:
```
docker-compose up -d
```
Esto iniciará una base de datos PostgreSQL en un contenedor Docker. La bandera -d corre el contenedor en modo separado, lo que significa que se ejecuta en segundo plano.

Para acceder a la base de datos PostgreSQL, puedes usar cualquier cliente PostgreSQL con los siguientes detalles de conexión:
 - Host: localhost
 - Port: 5432
 - User: postgres
 - Password: password
 - Database: mydatabase

Por favor, reemplaza User, Password y Database con el usuario, la contraseña y el nombre de la base de datos reales especificados en tu archivo .env.

Para detener el contenedor Docker, ejecuta el siguiente comando:
```
docker-compose down
```

Para generar la base de datos utilizando Prisma, sigue estos pasos:

1. Asegúrate de que el archivo `.env` en el directorio raíz del backend contenga la variable `DATABASE_URL` con la cadena de conexión correcta a tu base de datos PostgreSQL. Si no te funciona, prueba a reemplazar la URL completa directamente en `schema.prisma`, en la variable `url`.

2. Abre una terminal y navega al directorio del backend donde se encuentra el archivo `schema.prisma` y `seed.ts`.

3. Ejecuta los siguientes comandos para generar la estructura de prisma, las migraciones a tu base de datos y poblarla con datos de ejemplo:
```
npx prisma generate
npx prisma migrate dev
ts-node seed.ts
```

## Monitorización con Datadog

Para asegurar que nuestra aplicación funciona correctamente y para entender su rendimiento, utilizamos Datadog, una potente plataforma de monitorización y análisis. Datadog nos permite recopilar métricas, trazas (seguimiento de solicitudes a través de diferentes servicios) y logs de nuestra aplicación y infraestructura.

Esto es especialmente útil para:
- Detectar y diagnosticar problemas rápidamente.
- Entender cómo los usuarios interactúan con la aplicación.
- Optimizar el rendimiento.
- Configurar alertas para ser notificados de comportamientos anómalos.

### ¿Cómo funciona?

Datadog funciona instalando "agentes" en nuestros servidores o integrando librerías específicas en nuestro código. Estos agentes y librerías recopilan datos y los envían a la plataforma de Datadog, donde podemos visualizarlos en dashboards, analizarlos y configurar alertas.

### Configuración Inicial (para un desarrollador)

Como desarrollador, normalmente no necesitarás configurar la infraestructura principal de Datadog, pero sí interactuarás con ella a través del código y, ocasionalmente, podrías necesitar ejecutar un agente localmente para pruebas.

**1. Cuenta de Datadog:**
   - Necesitarás acceso a la cuenta de Datadog de la organización. Tu líder de equipo o el responsable de infraestructura te proporcionará las credenciales o te añadirá como miembro.
   - Una vez dentro, familiarízate con la interfaz. Verás secciones para Métricas, Trazas (APM), Logs, Dashboards, etc.

**2. Variables de Entorno:**
   - La integración de Datadog en la aplicación a menudo requiere claves de API y otras configuraciones que se gestionan a través de variables de entorno.
   - Asegúrate de que tu archivo `.env` (o la configuración de entorno equivalente si usas Docker para desarrollo local con todo integrado) tenga las siguientes variables (los valores exactos te los proporcionará tu equipo):
     ```
     DD_API_KEY=<TU_API_KEY_DE_DATADOG>
     DD_APP_KEY=<TU_APP_KEY_DE_DATADOG> (a veces llamada DD_APPLICATION_KEY)
     DD_SITE=<TU_SITIO_DATADOG> (ej. "datadoghq.com" o "datadoghq.eu")
     DD_SERVICE=<NOMBRE_DEL_SERVICIO> (ej. "lti-backend", "lti-frontend")
     DD_ENV=<ENTORNO> (ej. "development", "staging", "production")
     DD_VERSION=<VERSION_DE_LA_APP> (ej. "1.0.5", se puede tomar del package.json)
     DD_LOGS_INJECTION=true (para inyectar IDs de traza en los logs)
     ```
   - **Importante:** Nunca subas tus claves de API a repositorios de código. Utiliza archivos `.env` (añadidos al `.gitignore`) o secretos de tu sistema de CI/CD.

### Integración en el Backend (Node.js con Express)

Nuestro backend utiliza la librería `dd-trace` para el Tracing Distribuido (APM) y el envío de métricas.

**Instalación (si no está ya en `package.json`):**
```sh
cd backend
npm install dd-trace
```

**Uso:**
La librería `dd-trace` generalmente se inicializa al principio del punto de entrada de tu aplicación (por ejemplo, en `backend/src/index.ts`).

```typescript
// backend/src/index.ts o similar

import tracer from 'dd-trace';

// Inicializar el tracer de Datadog
// Esto DEBE hacerse ANTES de importar cualquier otro módulo instrumentado (express, pg, etc.)
tracer.init({
  logInjection: true, // Asegura que los IDs de traza se añadan a los logs
  profiling: true,    // Habilita el profiler continuo
  env: process.env.DD_ENV,
  service: process.env.DD_SERVICE,
  version: process.env.DD_VERSION
  // Aquí puedes añadir más configuraciones específicas si es necesario,
  // como plugins para librerías específicas o tags personalizados.
});

// El resto de tus importaciones y código de la aplicación
import express from 'express';
// ... más importaciones

const app = express();
// ... configuración de la app

// Ejemplo de cómo añadir un tag personalizado a una traza
// app.use((req, res, next) => {
//   const span = tracer.scope().active();
//   if (span) {
//     span.setTag('user.id', req.user?.id || 'anonymous');
//   }
//   next();
// });

// ... resto del código del servidor
```

**¿Qué monitoriza automáticamente?**
Con `dd-trace` inicializado, muchas cosas se monitorizan automáticamente:
- **Solicitudes HTTP:** Tiempos de respuesta, códigos de estado, errores para cada endpoint.
- **Consultas a la base de datos:** Si usas `pg` (PostgreSQL) u otros drivers soportados, las consultas se trazarán.
- **Errores no capturados:** Se reportarán a Datadog.

**Logs:**
Para enviar logs a Datadog, puedes usar una librería de logging compatible (como Winston) y configurarla para que envíe logs a Datadog, o si el Agente de Datadog está corriendo en el mismo host/contenedor que tu aplicación, puede recoger los logs directamente de `stdout`/`stderr` o de archivos.
La opción `logInjection: true` en `dd-trace` es útil porque añade `dd.trace_id` y `dd.span_id` a tus logs, lo que permite correlacionarlos con las trazas en Datadog.

### Integración en el Frontend (React)

Para el frontend, Datadog ofrece la librería RUM (Real User Monitoring) y Logs.

**Instalación (si no está ya en `package.json`):**
```sh
cd frontend
npm install @datadog/browser-rum @datadog/browser-logs
```

**Uso (en `frontend/src/index.js` o `App.js`):**
```javascript
// frontend/src/index.js o App.js

import { datadogRum } from '@datadog/browser-rum';
import { datadogLogs } from '@datadog/browser-logs';

datadogRum.init({
  applicationId: '<TU_RUM_APPLICATION_ID>', // Te lo proporciona Datadog
  clientToken: '<TU_RUM_CLIENT_TOKEN>',    // Te lo proporciona Datadog
  site: process.env.REACT_APP_DD_SITE || 'datadoghq.com', // Asegúrate de que esta variable esté disponible
  service: process.env.REACT_APP_DD_SERVICE || 'lti-frontend',
  env: process.env.REACT_APP_DD_ENV || 'development',
  version: process.env.REACT_APP_DD_VERSION || '1.0.0', // Puedes obtenerla del package.json
  sessionSampleRate: 100, // Muestra todas las sesiones (ajusta para producción)
  sessionReplaySampleRate: 20, // Graba el 20% de las sesiones (ajusta según necesidad y coste)
  trackUserInteractions: true,
  trackResources: true,
  trackLongTasks: true,
  defaultPrivacyLevel: 'mask-user-input' // Controla la privacidad de los datos capturados
});

datadogLogs.init({
  clientToken: '<TU_LOGS_CLIENT_TOKEN>', // Te lo proporciona Datadog
  site: process.env.REACT_APP_DD_SITE || 'datadoghq.com',
  service: process.env.REACT_APP_DD_SERVICE || 'lti-frontend',
  env: process.env.REACT_APP_DD_ENV || 'development',
  forwardErrorsToLogs: true,
  sessionSampleRate: 100,
});

// Para iniciar la grabación de sesión RUM (si está habilitada)
datadogRum.startSessionReplayRecording();

// Puedes enviar logs personalizados así:
// datadogLogs.logger.info('Usuario ha iniciado sesión', { user_id: '123' });
```
**Variables de Entorno en React:**
Recuerda que para acceder a variables de entorno en React (creado con Create React App), deben empezar con `REACT_APP_`. Deberás definir `REACT_APP_DD_SITE`, `REACT_APP_DD_SERVICE`, `REACT_APP_DD_ENV`, `REACT_APP_DD_VERSION` en tu archivo `.env` del frontend.

**¿Qué monitoriza?**
- **Vistas de página:** Qué páginas visitan los usuarios.
- **Interacciones de usuario:** Clics, errores de JavaScript.
- **Rendimiento de carga:** Tiempos de carga de recursos, Core Web Vitals.
- **Logs del navegador:** Errores de consola, logs personalizados.
- **Session Replay:** Grabaciones visuales de las sesiones de usuario (si está configurado).

### Monitorización de PostgreSQL con Datadog

Si PostgreSQL se ejecuta en un host o contenedor donde el Agente de Datadog puede acceder, puedes configurarlo para que recopile métricas directamente de la base de datos.

**Configuración del Agente de Datadog:**
Esto generalmente lo hace el equipo de infraestructura, pero es bueno saberlo:
1.  El Agente de Datadog debe estar instalado en el servidor de la base de datos o en un host que pueda conectarse a ella.
2.  Se habilita la integración de PostgreSQL en la configuración del Agente (`postgres.d/conf.yaml`).
    ```yaml
    init_config:

    instances:
      - host: localhost # O la IP/hostname de tu servidor PostgreSQL
        port: 5432
        username: datadog # Un usuario específico para Datadog con permisos de lectura
        password: <TU_PASSWORD_PARA_EL_USUARIO_DATADOG>
        dbm: true # Habilita Database Monitoring
        relations: true # Recopila métricas por tabla
        tags:
          - "env:<TU_ENTORNO>"
          - "service:postgresql"
    ```
3.  Se crea un usuario `datadog` en PostgreSQL con los permisos necesarios (generalmente, `pg_monitor` y acceso a `pg_stat_activity`).

**¿Qué se monitoriza?**
- Conexiones, ratios de aciertos de caché, queries lentas, replicación, y muchas más métricas específicas de PostgreSQL.
- Con DBM (Database Monitoring), puedes ver el rendimiento de las queries, planes de ejecución, etc.

### ¿Cómo puedes contribuir como desarrollador junior?

¡Hay muchas formas de empezar a usar y mejorar la monitorización!

1.  **Explora los Dashboards Existentes:**
    *   Pide a tu equipo que te muestre los dashboards principales en Datadog.
    *   Intenta entender qué métricas se están mostrando y por qué son importantes.
    *   Observa cómo se correlacionan las métricas del backend, frontend y la base de datos.

2.  **Añade Logs Contextuales:**
    *   Cuando estés desarrollando una nueva funcionalidad o arreglando un bug, piensa qué información sería útil en los logs si algo sale mal.
    *   En el backend: `console.log('Mensaje útil', { datoImportante: valor });` (si usas una librería de logging configurada, usa su sintaxis). `dd-trace` enriquecerá estos logs.
    *   En el frontend: `datadogLogs.logger.info('Acción del usuario X', { detalle: 'valor' });`

3.  **Añade Trazas Personalizadas (Spans):**
    *   Si tienes una operación compleja o una sección de código cuyo rendimiento quieres medir específicamente, puedes crear "spans" personalizados.
    *   Backend (Node.js):
        ```typescript
        import tracer from 'dd-trace';

        async function miOperacionCompleja() {
          const span = tracer.startSpan('operacion.compleja');
          try {
            // ... tu código ...
            span.setTag('parametro.importante', 'valor');
            // ... más código ...
          } catch (error) {
            span.setTag('error', error);
            throw error;
          } finally {
            span.finish();
          }
        }
        ```

4.  **Propón Nuevas Métricas o Alertas:**
    *   Mientras trabajas, si piensas "sería útil saber cuántas veces ocurre X" o "deberíamos ser alertados si Y pasa de Z", ¡propónlo!
    *   Datadog permite crear métricas personalizadas y alertas complejas.

5.  **Revisa las Sesiones de Usuario (RUM):**
    *   Si estás trabajando en el frontend, mira las grabaciones de sesiones (Session Replay) para entender cómo los usuarios reales interactúan con tu nueva funcionalidad o para reproducir bugs.
    *   Analiza los errores de JavaScript que se reportan en RUM.

6.  **Analiza el Rendimiento de las Queries (DBM):**
    *   Si estás optimizando una parte del backend que interactúa mucho con la base de datos, usa Datadog Database Monitoring para ver qué queries son lentas o se ejecutan con mucha frecuencia.

7.  **Pregunta y Aprende:**
    *   No dudes en preguntar a los miembros más experimentados del equipo sobre cómo usan Datadog o si tienes dudas sobre alguna métrica o dashboard.

La monitorización es un campo amplio y siempre hay algo nuevo que aprender. Empezar por entender lo básico y cómo se aplica a tu proyecto te convertirá en un desarrollador más eficaz.

Una vez has dado todos los pasos, deberías poder guardar nuevos candidatos, tanto via web, como via API, verlos en la base de datos y obtenerlos mediante GET por id. 

```
POST http://localhost:3010/candidates
{
    "firstName": "Albert",
    "lastName": "Saelices",
    "email": "albert.saelices@gmail.com",
    "phone": "656874937",
    "address": "Calle Sant Dalmir 2, 5ºB. Barcelona",
    "educations": [
        {
            "institution": "UC3M",
            "title": "Computer Science",
            "startDate": "2006-12-31",
            "endDate": "2010-12-26"
        }
    ],
    "workExperiences": [
        {
            "company": "Coca Cola",
            "position": "SWE",
            "description": "",
            "startDate": "2011-01-13",
            "endDate": "2013-01-17"
        }
    ],
    "cv": {
        "filePath": "uploads/1715760936750-cv.pdf",
        "fileType": "application/pdf"
    }
}
```

