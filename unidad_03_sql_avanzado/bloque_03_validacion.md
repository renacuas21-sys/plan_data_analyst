# Unidad 3 — Bloque 3: Modelo estrella de ventas

## 1. Objetivo

Diseñar y construir un modelo dimensional de ventas en PostgreSQL que permita analizar operaciones por cliente, producto, sucursal y fecha.

## 2. Modelo construido

Se creó el esquema `modelo_ventas`, compuesto por cinco tablas:

- `dim_customer`: catálogo de clientes.
- `dim_product`: catálogo de productos y categorías.
- `dim_branch`: catálogo de sucursales y regiones.
- `dim_date`: calendario de análisis.
- `fact_sales`: tabla central de operaciones comerciales.

**Granularidad:** cada registro de `fact_sales` representa una línea de venta. Un ticket puede contener varios productos y, por tanto, varias líneas.

Se establecieron claves primarias, claves foráneas y restricciones de calidad de datos.

## 3. Resultados validados

| Indicador | Resultado |
|---|---:|
| Líneas de venta | 5 |
| Tickets únicos | 4 |
| Unidades vendidas | 9 |
| Ingresos totales | $54,500 |

### Resultados por sucursal

| Sucursal | Unidades | Ingresos |
|---|---:|---:|
| Norte | 3 | $34,000 |
| Centro | 3 | $16,000 |
| Sur | 3 | $4,500 |

## 4. Hallazgos

**Composición de productos:** aunque las tres sucursales vendieron la misma cantidad de unidades, sus ingresos fueron distintos.

Norte vendió dos laptops y un monitor; Centro, una laptop y dos mouse; Sur, tres teclados.

La diferencia de ingresos se explica por la combinación de productos vendidos en esta muestra.

**Análisis temporal:** Norte registró ventas en dos fechas, mientras que Centro y Sur registraron ventas en una fecha cada una.

Se identificaron combinaciones de fechas y sucursales sin operaciones registradas.

**Calidad de datos:** las pruebas de integridad referencial no identificaron ventas con referencias inválidas a clientes, productos, sucursales o fechas.

## 5. Interpretación de negocio

Los resultados permiten identificar diferencias en ingresos, productos comercializados y días con actividad.

Sin embargo, el periodo observado es demasiado corto para evaluar de manera concluyente el desempeño de las sucursales.

Antes de recomendar acciones comerciales es necesario verificar:

- Que los registros de ventas estén completos.
- Que las sucursales hayan estado operando en las fechas analizadas.
- La composición de productos vendidos.
- La recurrencia y concentración de clientes.
- Los costos y márgenes de utilidad.

**Conclusión:** mayores ingresos no implican necesariamente mayor rentabilidad.

## 6. Aprendizajes técnicos

- Diseño de modelos dimensionales.
- Diferencia entre dimensiones y tablas de hechos.
- Granularidad de una línea de venta.
- Claves primarias y foráneas.
- Uso de `INNER JOIN`, `LEFT JOIN` y `CROSS JOIN`.
- Agregaciones con `COUNT`, `SUM` y `GROUP BY`.
- Uso de `COUNT(DISTINCT ...)` para evitar duplicar tickets.
- Uso de `COALESCE` para presentar combinaciones sin ventas registradas.
- Validación de integridad referencial.

## 7. Limitaciones

El ejercicio utiliza datos de prueba correspondientes al 1 y 2 de octubre de 2026, con un calendario que también incluye el 30 de septiembre y el 3 de octubre.

No se dispone de costos, márgenes, objetivos comerciales, horarios operativos ni información suficiente para clasificar clientes como nuevos o recurrentes.

Los resultados deben interpretarse como una demostración técnica del modelo, no como una evaluación definitiva de las sucursales.

## 8. Estado del bloque

**Construcción y validaciones técnicas: completadas.**

Pendiente: respaldar los archivos del Bloque 3 en GitHub y realizar el cierre formal del entregable.

## 9. Puntos para revisar con Francisco

- Validar la granularidad del modelo estrella.
- Revisar la estructura de las dimensiones y la tabla de hechos.
- Evaluar las consultas de análisis comercial.
- Comentar la diferencia entre facturación y rentabilidad.
- Identificar mejoras para un modelo con datos reales.

