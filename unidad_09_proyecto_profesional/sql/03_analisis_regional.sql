
-- ============================================================
-- UNIDAD 09 - PROYECTO PROFESIONAL
-- DISTRIBUIDORA OCCIDENTE
-- 03_analisis_regional.sql
-- Objetivo: comparar ventas, costos y rentabilidad
-- bruta de las tres regiones comerciales.
-- ============================================================

SELECT
    r.nombre_region AS region,

    COUNT(DISTINCT v.id_venta) AS operaciones,

    ROUND(
        SUM(d.cantidad * d.precio_unitario), 2
    ) AS ventas_totales,

    ROUND(
        SUM(d.cantidad * d.costo_unitario_venta), 2
    ) AS costo_mercancia,

    ROUND(
        SUM(
            d.cantidad *
            (d.precio_unitario - d.costo_unitario_venta)
        ), 2
    ) AS utilidad_bruta,

    ROUND(
        100.0 *
        SUM(
            d.cantidad *
            (d.precio_unitario - d.costo_unitario_venta)
        )
        / NULLIF(
            SUM(d.cantidad * d.precio_unitario), 0
        ), 2
    ) AS margen_bruto_pct,

    ROUND(
        SUM(d.cantidad * d.precio_unitario)
        / NULLIF(COUNT(DISTINCT v.id_venta), 0),
        2
    ) AS ticket_promedio

FROM regiones r

JOIN ventas v
    ON r.id_region = v.id_region

JOIN detalle_ventas d
    ON v.id_venta = d.id_venta

GROUP BY r.nombre_region

ORDER BY utilidad_bruta DESC;

