-- PLAN PARA DATA ANALYST
-- UNIDAD 3 | BLOQUE 3
-- ANALISIS DEL MODELO ESTRELLA
-- Base de datos: plan_data_analyst
-- Esquema: modelo_ventas

-- 1. INDICADORES GENERALES
-- Resultado esperado:
-- 5 lineas, 4 tickets, 9 unidades, $54,500

SELECT
    COUNT(*) AS lineas_venta,
    COUNT(DISTINCT id_ticket) AS tickets,
    SUM(unidades) AS unidades_vendidas,
    SUM(importe) AS importe_total
FROM modelo_ventas.fact_sales;


-- 2. VENTAS POR SUCURSAL

SELECT
    b.nombre_sucursal,
    SUM(f.unidades) AS unidades_vendidas,
    SUM(f.importe) AS importe_total
FROM modelo_ventas.fact_sales AS f
INNER JOIN modelo_ventas.dim_branch AS b
    ON f.id_sucursal = b.id_sucursal
GROUP BY b.nombre_sucursal
ORDER BY importe_total DESC;


-- 3. VENTAS POR SUCURSAL Y PRODUCTO

SELECT
    b.nombre_sucursal,
    p.nombre_producto,
    p.categoria,
    SUM(f.unidades) AS unidades_vendidas,
    SUM(f.importe) AS importe_total
FROM modelo_ventas.fact_sales AS f
INNER JOIN modelo_ventas.dim_branch AS b
    ON f.id_sucursal = b.id_sucursal
INNER JOIN modelo_ventas.dim_product AS p
    ON f.id_producto = p.id_producto
GROUP BY
    b.nombre_sucursal,
    p.nombre_producto,
    p.categoria
ORDER BY
    b.nombre_sucursal,
    importe_total DESC;


-- 4. VENTAS DIARIAS POR SUCURSAL
-- Incluye fechas sin ventas registradas.

SELECT
    d.fecha,
    b.nombre_sucursal,
    COALESCE(SUM(f.unidades), 0) AS unidades_vendidas,
    COALESCE(SUM(f.importe), 0) AS importe_total
FROM modelo_ventas.dim_date AS d
CROSS JOIN modelo_ventas.dim_branch AS b
LEFT JOIN modelo_ventas.fact_sales AS f
    ON f.id_fecha = d.id_fecha
   AND f.id_sucursal = b.id_sucursal
GROUP BY
    d.fecha,
    b.nombre_sucursal
ORDER BY
    d.fecha,
    b.nombre_sucursal;


-- 5. VALIDACION DE INTEGRIDAD REFERENCIAL
-- Resultado esperado: 5 ventas y 0 referencias invalidas.

SELECT
    COUNT(*) AS total_ventas,
    COUNT(*) FILTER (
        WHERE c.id_cliente IS NULL
    ) AS clientes_invalidos,
    COUNT(*) FILTER (
        WHERE p.id_producto IS NULL
    ) AS productos_invalidos,
    COUNT(*) FILTER (
        WHERE b.id_sucursal IS NULL
    ) AS sucursales_invalidas,
    COUNT(*) FILTER (
        WHERE d.id_fecha IS NULL
    ) AS fechas_invalidas
FROM modelo_ventas.fact_sales AS f
LEFT JOIN modelo_ventas.dim_customer AS c
    ON f.id_cliente = c.id_cliente
LEFT JOIN modelo_ventas.dim_product AS p
    ON f.id_producto = p.id_producto
LEFT JOIN modelo_ventas.dim_branch AS b
    ON f.id_sucursal = b.id_sucursal
LEFT JOIN modelo_ventas.dim_date AS d
    ON f.id_fecha = d.id_fecha;

    