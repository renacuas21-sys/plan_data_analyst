# Registro de calidad de datos

## Unidad 1 - Bloque 1

Proyecto: Plan para Data Analyst
Fecha: 8 de octubre de 2026

## Objetivo

Identificar, documentar y dar seguimiento a problemas
de calidad en los datos de ventas, sin modificar
la informacion original.

## Fuente de datos

Tabla de ventas de ejemplo utilizada durante
los ejercicios del Bloque 1.
## Incidencias detectadas

### Incidencia 001 - Precio unitario faltante y posible duplicidad

**Descripción:** Se identifican dos registros correspondientes al ticket 2004, ambos con el precio unitario faltante y con la misma información de producto y unidades.

**Acción recomendada:** Informar la incidencia al área responsable y solicitar la validación del precio unitario y de la posible duplicidad, conservando los registros originales hasta recibir confirmación.

**Estado:** Pendiente de validación.

### Incidencia 002 - Registro con cero unidades

**Descripción:** Se identifica que el ticket 2003 contiene un registro de venta de monitor con cero unidades, por lo que se desconoce si corresponde a una operación válida, cancelada o a un error de registro.

**Acción recomendada:** Informar la incidencia al área responsable y solicitar la validación de las unidades registradas y del estado de la operación, para determinar el motivo del valor cero.

**Estado:** Pendiente de validación.