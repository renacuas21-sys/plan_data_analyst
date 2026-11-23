WITH por_categoria AS (
    SELECT
        p.categoria,
        COUNT(DISTINCT d.id_producto)             AS productos_distintos,
        SUM(d.cantidad)                           AS unidades_vendidas,
        SUM(d.cantidad * d.precio_unitario)       AS ventas_totales,
        SUM(d.cantidad * d.costo_unitario_venta)  AS costo_total
    FROM detalle_ventas d
    JOIN productos p ON p.id_producto = d.id_producto
    GROUP BY p.categoria
)
SELECT
    categoria,
    productos_distintos,
    unidades_vendidas,
    ROUND(ventas_totales, 2)                           AS ventas_totales,
    ROUND(costo_total, 2)                              AS costo_total,
    ROUND(ventas_totales - costo_total, 2)             AS utilidad_bruta,
    ROUND(100.0 * (ventas_totales - costo_total)
          / NULLIF(ventas_totales, 0), 2)              AS margen_bruto_pct,
    ROUND(100.0 * ventas_totales
          / SUM(ventas_totales) OVER (), 2)            AS participacion_ventas_pct
FROM por_categoria
ORDER BY utilidad_bruta DESC;

