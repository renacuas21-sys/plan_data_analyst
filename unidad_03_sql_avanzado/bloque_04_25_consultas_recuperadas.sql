-- PLAN DATA ANALYST | UNIDAD 3 BLOQUE 4
-- CONSOLIDACION DE 25 CONSULTAS SQL
-- IMPORTANTE: CONSULTAS 10-15 RECONSTRUIDAS A PARTIR DE TEMAS Y RESULTADOS;
-- REVISAR CONTRA HISTORIAL ANTES DE DECLARAR COINCIDENCIA TEXTUAL.
-- CONSULTAS 01-02 TRANSCRITAS DE CAPTURA; 03-09, 16-25 RECUPERADAS
-- O RECONSTRUIDAS FIELMENTE A PARTIR DE LA CONVERSACION.

-- CONSULTA 01: Lineas, tickets, unidades e ingresos del modelo
SELECT COUNT(*) AS lineas_venta,
       COUNT(DISTINCT id_ticket) AS tickets_unicos,
       SUM(unidades) AS unidades_vendidas,
       SUM(importe) AS importe_total
FROM modelo_ventas.fact_sales;

-- CONSULTA 02: Lineas, unidades e importe por ticket
SELECT id_ticket,
       COUNT(*) AS lineas_por_ticket,
       SUM(unidades) AS unidades_por_ticket,
       SUM(importe) AS importe_por_ticket
FROM modelo_ventas.fact_sales
GROUP BY id_ticket
ORDER BY lineas_por_ticket DESC, id_ticket;

-- CONSULTA 03: Inspeccionar las lineas del ticket T-001
SELECT *
FROM modelo_ventas.fact_sales
WHERE id_ticket = 'T-001';

-- CONSULTA 04: Productos dentro del ticket T-001
SELECT f.id_ticket, p.nombre_producto, p.categoria, f.unidades, f.importe
FROM modelo_ventas.fact_sales AS f
INNER JOIN modelo_ventas.dim_product AS p ON f.id_producto = p.id_producto
WHERE f.id_ticket = 'T-001'
ORDER BY f.id_linea_venta;

-- CONSULTA 05: Unidades e ingresos por producto
SELECT p.nombre_producto,
       SUM(f.unidades) AS unidades_vendidas,
       SUM(f.importe) AS ingresos_totales
FROM modelo_ventas.fact_sales AS f
INNER JOIN modelo_ventas.dim_product AS p ON f.id_producto = p.id_producto
GROUP BY p.id_producto, p.nombre_producto
ORDER BY ingresos_totales DESC;

-- CONSULTA 06: Ingresos por categoria
SELECT p.categoria,
       SUM(f.unidades) AS unidades_vendidas,
       SUM(f.importe) AS ingresos_totales
FROM modelo_ventas.fact_sales AS f
INNER JOIN modelo_ventas.dim_product AS p ON f.id_producto = p.id_producto
GROUP BY p.categoria
ORDER BY ingresos_totales DESC;

-- CONSULTA 07: Ingresos por sucursal y region
SELECT s.nombre_sucursal, s.region,
       SUM(f.unidades) AS unidades_vendidas,
       SUM(f.importe) AS ingresos_totales
FROM modelo_ventas.fact_sales AS f
INNER JOIN modelo_ventas.dim_branch AS s ON f.id_sucursal = s.id_sucursal
GROUP BY s.id_sucursal, s.nombre_sucursal, s.region
ORDER BY ingresos_totales DESC;

-- CONSULTA 08: Ventas por sucursal y categoria (reconstruccion de estructura recuperada)
SELECT s.nombre_sucursal, p.categoria,
       SUM(f.unidades) AS unidades_vendidas,
       SUM(f.importe) AS ingresos_totales
FROM modelo_ventas.fact_sales AS f
INNER JOIN modelo_ventas.dim_branch AS s ON f.id_sucursal = s.id_sucursal
INNER JOIN modelo_ventas.dim_product AS p ON f.id_producto = p.id_producto
GROUP BY s.nombre_sucursal, p.categoria
ORDER BY s.nombre_sucursal, ingresos_totales DESC;

-- CONSULTA 09: Tickets, unidades e ingresos por cliente (estructura recuperada)
SELECT c.nombre,
       COUNT(DISTINCT f.id_ticket) AS tickets_comprados,
       SUM(f.unidades) AS unidades_compradas,
       SUM(f.importe) AS ingresos_generados
FROM modelo_ventas.fact_sales AS f
INNER JOIN modelo_ventas.dim_customer AS c ON f.id_cliente = c.id_cliente
GROUP BY c.id_cliente, c.nombre
ORDER BY ingresos_generados DESC;

-- CONSULTA 10: RECONSTRUIDA, PENDIENTE DE COTEJO. Ticket promedio por cliente
SELECT c.nombre,
       COUNT(DISTINCT f.id_ticket) AS tickets_comprados,
       SUM(f.importe) AS ingresos_totales,
       ROUND(SUM(f.importe) / NULLIF(COUNT(DISTINCT f.id_ticket), 0), 2) AS ticket_promedio
FROM modelo_ventas.fact_sales AS f
INNER JOIN modelo_ventas.dim_customer AS c ON f.id_cliente = c.id_cliente
GROUP BY c.id_cliente, c.nombre
ORDER BY ticket_promedio DESC;

-- CONSULTA 11: RECONSTRUIDA, PENDIENTE DE COTEJO. Ventas diarias incluyendo fechas sin ventas
SELECT d.fecha,
       COALESCE(SUM(f.importe), 0) AS ingresos_diarios,
       COALESCE(SUM(f.unidades), 0) AS unidades_diarias
FROM modelo_ventas.dim_date AS d
LEFT JOIN modelo_ventas.fact_sales AS f ON d.id_fecha = f.id_fecha
GROUP BY d.id_fecha, d.fecha
ORDER BY d.fecha;

-- CONSULTA 12: RECONSTRUIDA DE ESTRUCTURA RECUPERADA. Ingreso acumulado por fecha
WITH ventas_diarias AS (
    SELECT d.fecha, COALESCE(SUM(f.importe), 0) AS ingreso_diario
    FROM modelo_ventas.dim_date AS d
    LEFT JOIN modelo_ventas.fact_sales AS f ON d.id_fecha = f.id_fecha
    GROUP BY d.id_fecha, d.fecha
)
SELECT fecha, ingreso_diario,
       SUM(ingreso_diario) OVER (
           ORDER BY fecha ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
       ) AS ingreso_acumulado
FROM ventas_diarias
ORDER BY fecha;

-- CONSULTA 13: RECONSTRUIDA DE ESTRUCTURA RECUPERADA. Acumulado por sucursal y fecha
SELECT s.nombre_sucursal, d.fecha,
       SUM(f.importe) AS ingresos_dia,
       SUM(SUM(f.importe)) OVER (
           PARTITION BY s.id_sucursal ORDER BY d.fecha
           ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
       ) AS ingresos_acumulados_sucursal
FROM modelo_ventas.fact_sales AS f
INNER JOIN modelo_ventas.dim_branch AS s ON f.id_sucursal = s.id_sucursal
INNER JOIN modelo_ventas.dim_date AS d ON f.id_fecha = d.id_fecha
GROUP BY s.id_sucursal, s.nombre_sucursal, d.fecha
ORDER BY s.nombre_sucursal, d.fecha;

-- CONSULTA 14: RECONSTRUIDA DE ESTRUCTURA RECUPERADA. Participacion de ingresos por sucursal
SELECT s.nombre_sucursal,
       SUM(f.importe) AS ingresos_totales,
       ROUND(100.0 * SUM(f.importe) /
           NULLIF(SUM(SUM(f.importe)) OVER (), 0), 2) AS participacion_pct
FROM modelo_ventas.fact_sales AS f
INNER JOIN modelo_ventas.dim_branch AS s ON f.id_sucursal = s.id_sucursal
GROUP BY s.id_sucursal, s.nombre_sucursal
ORDER BY ingresos_totales DESC;

-- CONSULTA 15: RECONSTRUIDA DE ESTRUCTURA RECUPERADA. Participacion acumulada por sucursal
WITH ventas_sucursal AS (
    SELECT s.nombre_sucursal, SUM(f.importe) AS ingresos_totales
    FROM modelo_ventas.fact_sales AS f
    INNER JOIN modelo_ventas.dim_branch AS s ON f.id_sucursal = s.id_sucursal
    GROUP BY s.id_sucursal, s.nombre_sucursal
)
SELECT nombre_sucursal, ingresos_totales,
       ROUND(100.0 * SUM(ingresos_totales) OVER (
           ORDER BY ingresos_totales DESC, nombre_sucursal
           ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
       ) / NULLIF(SUM(ingresos_totales) OVER (), 0), 2) AS participacion_acumulada_pct
FROM ventas_sucursal
ORDER BY ingresos_totales DESC, nombre_sucursal;

-- CONSULTA 16: Sucursal con mayores ingresos
SELECT s.nombre_sucursal, SUM(f.importe) AS total_ventas
FROM modelo_ventas.fact_sales AS f
INNER JOIN modelo_ventas.dim_branch AS s ON f.id_sucursal = s.id_sucursal
GROUP BY s.id_sucursal, s.nombre_sucursal
ORDER BY total_ventas DESC
LIMIT 1;

-- CONSULTA 17: Ranking de sucursales por unidades
WITH ventas_sucursal AS (
    SELECT s.nombre_sucursal, SUM(f.unidades) AS total_unidades
    FROM modelo_ventas.fact_sales AS f
    INNER JOIN modelo_ventas.dim_branch AS s ON f.id_sucursal = s.id_sucursal
    GROUP BY s.id_sucursal, s.nombre_sucursal
)
SELECT nombre_sucursal, total_unidades,
       DENSE_RANK() OVER (ORDER BY total_unidades DESC) AS posicion
FROM ventas_sucursal
ORDER BY posicion, nombre_sucursal;

-- CONSULTA 18: Ingreso promedio por unidad y sucursal
SELECT s.nombre_sucursal,
       SUM(f.unidades) AS unidades_vendidas,
       SUM(f.importe) AS ingresos_totales,
       ROUND(SUM(f.importe) / NULLIF(SUM(f.unidades), 0), 2) AS ingreso_promedio_unidad
FROM modelo_ventas.fact_sales AS f
INNER JOIN modelo_ventas.dim_branch AS s ON f.id_sucursal = s.id_sucursal
GROUP BY s.id_sucursal, s.nombre_sucursal
ORDER BY ingreso_promedio_unidad DESC;

-- CONSULTA 19: Participacion de ingresos por producto
WITH ingresos_producto AS (
    SELECT p.nombre_producto, SUM(f.importe) AS ingresos
    FROM modelo_ventas.fact_sales AS f
    INNER JOIN modelo_ventas.dim_product AS p ON f.id_producto = p.id_producto
    GROUP BY p.id_producto, p.nombre_producto
)
SELECT nombre_producto, ingresos,
       ROUND(ingresos * 100.0 / NULLIF(SUM(ingresos) OVER (), 0), 2)
           AS porcentaje_participacion
FROM ingresos_producto
ORDER BY ingresos DESC;

-- CONSULTA 20: Clasificacion de productos segun participacion
WITH ingresos_producto AS (
    SELECT p.nombre_producto, SUM(f.importe) AS ingresos
    FROM modelo_ventas.fact_sales AS f
    INNER JOIN modelo_ventas.dim_product AS p ON f.id_producto = p.id_producto
    GROUP BY p.id_producto, p.nombre_producto
),
participacion AS (
    SELECT nombre_producto, ingresos,
           ROUND(ingresos * 100.0 / NULLIF(SUM(ingresos) OVER (), 0), 2) AS porcentaje
    FROM ingresos_producto
)
SELECT nombre_producto, ingresos, porcentaje,
       CASE WHEN porcentaje >= 50 THEN 'Alta participacion'
            WHEN porcentaje >= 10 THEN 'Media participacion'
            ELSE 'Baja participacion'
       END AS clasificacion
FROM participacion
ORDER BY porcentaje DESC;

-- CONSULTA 21: Clientes que superan el ingreso promedio por cliente
WITH ingresos_cliente AS (
    SELECT c.nombre, SUM(f.importe) AS ingresos_totales
    FROM modelo_ventas.fact_sales AS f
    INNER JOIN modelo_ventas.dim_customer AS c ON f.id_cliente = c.id_cliente
    GROUP BY c.id_cliente, c.nombre
),
comparacion AS (
    SELECT nombre, ingresos_totales,
           ROUND(AVG(ingresos_totales) OVER (), 2) AS promedio_clientes
    FROM ingresos_cliente
)
SELECT nombre, ingresos_totales, promedio_clientes
FROM comparacion
WHERE ingresos_totales > promedio_clientes
ORDER BY ingresos_totales DESC;

-- CONSULTA 22: Clientes con mas de un ticket
SELECT c.nombre,
       COUNT(DISTINCT f.id_ticket) AS total_compras,
       SUM(f.importe) AS ingresos_totales
FROM modelo_ventas.fact_sales AS f
INNER JOIN modelo_ventas.dim_customer AS c ON f.id_cliente = c.id_cliente
GROUP BY c.id_cliente, c.nombre
HAVING COUNT(DISTINCT f.id_ticket) > 1
ORDER BY total_compras DESC;

-- CONSULTA 23: Productos sin ventas
SELECT p.id_producto, p.nombre_producto, p.categoria
FROM modelo_ventas.dim_product AS p
LEFT JOIN modelo_ventas.fact_sales AS f ON p.id_producto = f.id_producto
WHERE f.id_producto IS NULL
ORDER BY p.nombre_producto;

-- CONSULTA 24: Dias sin ventas
SELECT d.fecha,
       COALESCE(SUM(f.importe), 0) AS ingresos_totales,
       COALESCE(SUM(f.unidades), 0) AS unidades_vendidas
FROM modelo_ventas.dim_date AS d
LEFT JOIN modelo_ventas.fact_sales AS f ON d.id_fecha = f.id_fecha
GROUP BY d.id_fecha, d.fecha
HAVING COUNT(f.id_linea_venta) = 0
ORDER BY d.fecha;

-- CONSULTA 25: Participacion acumulada por sucursal
WITH ventas_sucursal AS (
    SELECT s.nombre_sucursal, SUM(f.importe) AS ingresos_totales
    FROM modelo_ventas.fact_sales AS f
    INNER JOIN modelo_ventas.dim_branch AS s ON f.id_sucursal = s.id_sucursal
    GROUP BY s.id_sucursal, s.nombre_sucursal
)
SELECT nombre_sucursal, ingresos_totales,
       ROUND(ingresos_totales * 100.0 /
           NULLIF(SUM(ingresos_totales) OVER (), 0), 2) AS participacion_pct,
       ROUND(SUM(ingresos_totales) OVER (
           ORDER BY ingresos_totales DESC, nombre_sucursal
           ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
       ) * 100.0 / NULLIF(SUM(ingresos_totales) OVER (), 0), 2)
           AS participacion_acumulada_pct
FROM ventas_sucursal
