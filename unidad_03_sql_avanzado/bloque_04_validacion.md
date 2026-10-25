# Unidad 3 — Bloque 4: Validación de consultas SQL

**Proyecto:** Plan para Data Analyst  
**Fecha:** 25 de octubre de 2026  
**Base de datos:** `plan_data_analyst`  
**Esquema:** `modelo_ventas`  
**Herramientas:** PostgreSQL 18, pgAdmin 4, Visual Studio Code y GitHub.

## 1. Objetivo

Construir y ejecutar 25 consultas SQL orientadas a responder preguntas de negocio, validar la consistencia de los datos y obtener indicadores útiles para la toma de decisiones.

## 2. Actividades realizadas

Se completó una práctica de 25 consultas SQL utilizando el modelo de ventas desarrollado durante la Unidad 3.

Se trabajaron las siguientes competencias:

- Consultas con `SELECT`, `WHERE` y `ORDER BY`.
- Agrupaciones con `GROUP BY` y filtros con `HAVING`.
- Funciones de agregación: `COUNT`, `SUM` y `AVG`.
- Relaciones entre tablas mediante `INNER JOIN` y `LEFT JOIN`.
- Uso de `COUNT(DISTINCT)` para evitar duplicidades.
- Tratamiento de valores nulos mediante `COALESCE` y `NULLIF`.
- Expresiones condicionales con `CASE`.
- Consultas estructuradas mediante CTE (`WITH`).
- Funciones de ventana para rankings, porcentajes y acumulados.

## 3. Resultados principales

**Modelo analizado:**

| Indicador | Resultado |
|---|---:|
| Líneas de venta | 5 |
| Tickets únicos | 4 |
| Unidades vendidas | 9 |
| Ingresos totales | $54,500 |

**Ingresos por sucursal:**

| Sucursal | Ingresos | Participación |
|---|---:|---:|
| Norte | $34,000 | 62.39% |
| Centro | $16,000 | 29.36% |
| Sur | $4,500 | 8.26% |

Norte y Centro concentran conjuntamente el **91.74% de los ingresos**.

**Ingresos por producto:**

| Producto | Ingresos |
|---|---:|
| Laptop | $45,000 |
| Teclado | $4,500 |
| Monitor | $4,000 |
| Mouse | $1,000 |

La laptop representa el **82.57% de los ingresos** del modelo analizado.

**Clientes:**

Ana registra dos tickets únicos, ingresos por $46,000 y un ticket promedio de $23,000. Es la cliente con mayores ingresos dentro de la muestra.

**Fechas sin ventas:**

Se identificaron el 30 de septiembre y el 3 de octubre de 2026 como fechas del calendario analizado sin registros de venta.

## 4. Interpretación de negocio

El análisis permitió identificar una concentración importante de ingresos tanto por producto como por sucursal.

También se comprobó que una sucursal puede vender la misma cantidad de unidades que otra y, aun así, generar ingresos considerablemente diferentes.

Estos resultados permiten formular preguntas adicionales sobre diversificación de ingresos, comportamiento de clientes y desempeño comercial.

Los datos corresponden a una muestra de práctica y no permiten establecer conclusiones generales sobre el desempeño de un negocio real.

## 5. Evidencia y validación

**Estado de la práctica:** 25 de 25 consultas ejecutadas durante las sesiones de trabajo.

Se elaboró un archivo consolidado con las 25 consultas numeradas. Parte del código se recuperó o reconstruyó posteriormente a partir del trabajo realizado.

La consulta 10 reconstruida fue ejecutada nuevamente y sus resultados coincidieron con los valores esperados. No se realizó una nueva validación individual de todas las consultas reconstruidas.

**Archivos relacionados:**

- `bloque_04_25_consultas.sql`: archivo inicial de trabajo.
- `bloque_04_consultas.sql`: consulta final de participación acumulada.
- `bloque_04_25_consultas_recuperadas.sql`: consolidación de las 25 consultas, con reconstrucciones identificadas.
- `bloque_04_validacion.md`: presente documento.

## 6. Aprendizajes

Se reforzó la diferencia entre contar registros, tickets y unidades vendidas.

Se practicó la interpretación de indicadores comerciales y la selección de funciones SQL adecuadas

