# Unidad 3 — Bloque 2: Funciones de ventana y variación porcentual

**Fecha:** 25 de octubre de 2026  
**Herramientas:** PostgreSQL 18, pgAdmin 4 y Visual Studio Code.  
**Base de datos:** `plan_data_analyst`

## Objetivo

Utilizar funciones de ventana para comparar movimientos consecutivos de un mismo cliente y calcular su variación porcentual.

## Práctica realizada

- Consulta de movimientos originales.
- Aplicación de `LAG()` para recuperar el importe anterior.
- Uso de `PARTITION BY id_cliente` para separar los movimientos de cada cliente.
- Ordenamiento mediante `ORDER BY id_mov`.
- Cálculo de variación porcentual.
- Uso de `WITH` para organizar la consulta mediante una expresión de tabla común (CTE).
- Uso de `NULLIF()` para evitar divisiones entre cero.

## Resultados comprobados

| Movimiento | Cliente | Importe | Anterior | Variación |
|---|---|---:|---:|---:|
| 101 | Ana | $5,000 | NULL | NULL |
| 102 | Ana | $3,000 | $5,000 | -40 % |
| 103 | Luis | $7,000 | NULL | NULL |

## Interpretación

Ana registró una disminución del 40 % entre sus movimientos 101 y 102.

Luis no tiene un movimiento anterior registrado para realizar una comparación.

La secuencia está determinada por `id_mov`; no se dispone de fechas para interpretar los cambios como variaciones entre periodos de calendario.

## Aprendizajes principales

`LAG()` permite recuperar valores de registros anteriores sin perder el detalle de cada movimiento.

`PARTITION BY` define grupos independientes para la comparación.

La variación porcentual requiere distinguir entre aumentos y disminuciones, y controlar los valores nulos y las divisiones entre cero.

## Evidencia

Consulta ejecutable: `bloque_02_lag_variacion.sql`.

## Estado

Práctica integradora validada en PostgreSQL. Documentación preparada para respaldo en GitHub.

## Puntos para Francisco Delgadillo

- Aplicación de funciones de ventana en análisis de operaciones.
- Diferencia entre comparar movimientos por cliente y compararlos globalmente.
- Interpretación de variaciones porcentuales.
- Uso de CTE para organizar consultas analíticas.

