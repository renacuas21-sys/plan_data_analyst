# Preguntas de negocio

## Objetivo
Definir cinco preguntas de negocio que puedan responderse
mediante el análisis de datos de ventas, productos y rentabilidad.

## Pregunta 1: Producto más vendido

¿Qué producto registró la mayor cantidad de unidades
vendidas durante septiembre de 2026?

### Datos necesarios
- Fecha
- Producto
- Unidades vendidas

### Métrica principal
Total de unidades vendidas por producto.

### Propósito del análisis
Identificar qué productos concentran el mayor volumen
de ventas durante el periodo seleccionado.

## Pregunta 2: Producto con mayor utilidad bruta

¿Qué producto generó la mayor utilidad bruta total
durante septiembre de 2026?

### Datos necesarios
- Fecha
- Producto
- Unidades vendidas
- Precio unitario
- Costo unitario

### Métrica principal
Utilidad bruta total por producto.

### Propósito del análisis
Identificar qué productos contribuyen más a la
utilidad bruta de la empresa durante el periodo.

## Pregunta 3: Utilidad bruta por unidad

¿Qué productos generaron mayor utilidad bruta en relación con las unidades vendidas durante septiembre de 2026?

### Datos necesarios
- Fecha
- Producto_ID
- Estado
- Unidades
- Ingreso_neto
- Utilidad_bruta

### Métrica principal
Utilidad bruta por unidad = Utilidad bruta total / Unidades vendidas.

### Métrica complementaria
Margen bruto porcentual = Utilidad bruta total / Ingreso neto total × 100.

### Propósito del análisis
Identificar productos que generan mayor utilidad bruta por unidad vendida y comparar su margen bruto para apoyar decisiones comerciales.

## Pregunta 4: Productos con mayores devoluciones

¿Qué productos concentran el mayor importe de ventas registradas con estado Devuelta durante enero a septiembre de 2026?

### Datos necesarios
- Fecha
- Producto_ID
- Estado
- Ticket
- Ingreso_neto

### Métrica principal
Suma de Ingreso_neto de los registros con Estado = Devuelta, agrupada por producto.

### Métrica complementaria
Cantidad de registros devueltos por producto.

### Propósito del análisis
Identificar productos que requieren investigación por sus importes de devoluciones, sin asumir que representan pérdidas económicas definitivas ni atribuir causas sin validación.

## Pregunta 5: Comportamiento mensual de ventas

¿Cómo evolucionaron los ingresos netos y la utilidad bruta de los productos durante enero a septiembre de 2026?

### Datos necesarios
- Fecha
- Producto_ID
- Estado
- Ingreso_neto
- Utilidad_bruta

### Métricas principales
- Ingresos netos mensuales por producto.
- Utilidad bruta mensual por producto.

### Métrica complementaria
Variación porcentual de ingresos entre meses consecutivos, cuando exista información comparable.

### Propósito del análisis
Identificar productos con comportamiento estable, irregular o cambios relevantes en sus resultados mensuales, sin atribuir causas que no hayan sido comprobadas.