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

## Laboratorio de ventas — Análisis de calidad de datos

**Archivo:** laboratorio_ventas_data_analyst.xlsx
**Fecha de revisión:** 8 de octubre de 2026
**Objetivo:** Identificar problemas de calidad que afecten la confiabilidad de los indicadores financieros, sin modificar los datos originales.

### Incidencia LAB-001 — Precio unitario faltante
**Descripción:** Se identificaron cuatro registros de ventas completadas sin precio unitario, correspondientes a 14 unidades.

**Tickets afectados:**
- T-10019: 5 unidades.
- T-10192: 4 unidades.
- T-10451: 1 unidad.
- T-10635: 4 unidades.

**Impacto financiero:** Los registros tienen un costo total asociado de $36,826.49. No es posible determinar sus ingresos ni su utilidad bruta hasta validar los precios faltantes. Este importe no representa una pérdida comprobada.

**Acción realizada:** Se modificaron las fórmulas de Ingreso_neto y Utilidad_bruta para mostrar "PENDIENTE" cuando falta el precio unitario, evitando resultados financieros engañosos.

**Acción recomendada:** Solicitar los precios originales al área responsable y verificar los cálculos una vez recibida la información.

**Estado:** Pendiente de validación.

### Incidencia LAB-002 — Costo unitario faltante

**Descripción:** Se identificaron dos registros de ventas sin costo unitario, correspondientes a 7 unidades.

**Tickets afectados:**
- T-10042: 5 unidades.
- T-10365: 2 unidades.

**Impacto financiero:** Los registros presentan ingresos netos asociados por $107,655.584 (aproximadamente $107,655.58). Sin conocer sus costos, no es posible determinar la utilidad bruta de manera confiable. Inicialmente, Excel mostraba la utilidad igual al ingreso neto, generando una ganancia aparente que no estaba respaldada por los datos.

**Acción realizada:** Se modificaron las fórmulas de Costo_total y Utilidad_bruta para mostrar "PENDIENTE" cuando falta el costo unitario, evitando presentar ganancias no comprobadas.

**Acción recomendada:** Solicitar los costos unitarios originales al área responsable, validar los importes y recalcular la utilidad bruta. Revisar también el criterio de redondeo monetario.

**Estado:** Pendiente de validación.