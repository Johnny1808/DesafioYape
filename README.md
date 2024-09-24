# DesafioYape
QA Automation Engineer] Desafío técnico - Johnny Mallqui Moreno

# Desafío 1: Plan de Pruebas para Automatización de Servicios Web - API RestFul Booker

## 1. Objetivo
El objetivo de este plan de pruebas es garantizar la correcta funcionalidad de los servicios web proporcionados por la API RestFul Booker (https://restful-booker.herokuapp.com/apidoc/index.html) mediante la implementación de pruebas automatizadas a nivel de integración. El enfoque será minimizar los errores detectados a nivel de la interfaz gráfica de usuario (GUI) proporcionando feedback temprano a los desarrolladores.

## 2. Alcance
Las pruebas cubrirán los siguientes puntos clave de la API:
- Crear una reserva.
- Leer o consultar reservas existentes.
- Actualizar una reserva existente.
- Eliminar una reserva.
- Autenticación para operaciones protegidas (como actualizar y eliminar).
- Manejo de errores y validación de respuestas negativas.

## 3. Estrategia de Automatización
### Herramientas:
- Karate DSL y Postman.

## 4. Criterios de Salida
- Las pruebas se considerarán exitosas cuando se verifique que todos los end-points funcionan según lo especificado, y se gestionen correctamente los errores y validaciones.

## 5. Riesgos
- Cambios frecuentes en la API pueden requerir ajustes continuos en las pruebas automatizadas.
