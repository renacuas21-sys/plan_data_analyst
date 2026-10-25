# Unidad 3 — Bloque 1: Validación de consultas SQL

**Fecha:** 25 de octubre de 2026  
**Herramientas:** PostgreSQL 18, pgAdmin 4 y Visual Studio Code.  
**Base de datos:** `plan_data_analyst`  
**Esquema de práctica:** `practica_bloque_03`

## 1. Objetivo

Consolidar el uso de consultas SQL para relacionar tablas, identificar registros sin coincidencias, agrupar movimientos y calcular importes, comprendiendo los riesgos de duplicación de datos.

## 2. Actividades realizadas

- Consultas utilizando `SELECT`, `LEFT JOIN` y `GROUP BY`.
- Identificación de clientes sin movimientos mediante `IS NULL`.
- Cálculo de importes con `SUM()`.
- Conteo de movimientos con `COUNT(*)`.
- Tratamiento de valores nulos con `COALESCE()`.
- Análisis de las diferencias entre `INNER JOIN` y `LEFT JOIN`.
- Comprensión de la cardinalidad al relacionar movimientos y teléfonos.

## 3. Consulta integradora validada

```sql
SELECT
    id_cliente,
    COUNT(*) AS total_movimientos,
    SUM(importe) AS total_operado
FROM practica_bloque_03.movimientos
GROUP BY id_cliente
ORDER BY id_cliente;
```

## 4. Resultados obtenidos

| Cliente | Movimientos | Total operado |
|---|---:|---:|
| Ana (ID 1) | 2 | $8,000 |
| Luis (ID 2) | 1 | $7,000 |
| **Total** | **3** | **$15,000** |

Pedro no aparece porque no tiene movimientos registrados en la tabla consultada.

## 5. Aprendizajes principales

**Agrupación:** `GROUP BY` permite obtener un resumen por cliente sin perder la posibilidad de calcular diferentes métricas.

**Agregaciones:** `COUNT(*)` cuenta registros y `SUM(importe)` suma los valores de la columna indicada.

**Ausencia de registros:** un cliente sin movimientos no es lo mismo que un cliente con un movimiento de importe cero.

**Cardinalidad:** al relacionar tablas que contienen varios registros por cliente, pueden multiplicarse las filas y producirse importes incorrectos.

**Control de calidad:** antes de interpretar un reporte, es necesario verificar que los resultados correspondan a los registros originales.

## 6. Evaluación del bloque

- Comprensión conceptual: aprobada.
- Construcción de consulta SQL: aprobada.
- Ejecución en PostgreSQL: correcta.
- Validación de resultados: correcta.
- Documentación: preparada para respaldo.

**Conclusión:** práctica integradora del Bloque 1 aprobada. Pendiente completar el respaldo de archivos en GitHub.

## 7. Puntos para revisar con Francisco Delgadillo

- Uso correcto de relaciones entre tablas.
- Riesgos de duplicación al calcular indicadores financieros.
- Aplicación de consultas agregadas para elaborar reportes por cliente.
- Próximos pasos para construir consultas más complejas.

