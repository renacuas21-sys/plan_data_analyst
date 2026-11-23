WITH detalle_por_venta AS (
    SELECT
        id_venta,
        SUM(cantidad * precio_unitario)       AS ventas,
        SUM(cantidad * costo_unitario_venta)  AS costo
    FROM detalle_ventas
    GROUP BY id_venta
),
por_cliente AS (
    SELECT
        v.id_cliente,
        COUNT(*)      AS num_operaciones,
        SUM(d.ventas) AS ventas_totales,
        SUM(d.costo)  AS costo_total
    FROM ventas v
    JOIN detalle_por_venta d ON d.id_venta = v.id_venta
    GROUP BY v.id_cliente
)
SELECT
    c.id_cliente,
    c.nombre,
    r.nombre_region AS region,
    p.num_operaciones,
    ROUND(p.ventas_totales, 2)                      AS ventas_totales,
    ROUND(p.costo_total, 2)                         AS costo_total,
    ROUND(p.ventas_totales - p.costo_total, 2)      AS utilidad_bruta,
    ROUND(100.0 * (p.ventas_totales - p.costo_total)
          / NULLIF(p.ventas_totales, 0), 2)         AS margen_bruto_pct
FROM por_cliente p
JOIN clientes c ON c.id_cliente = p.id_cliente
JOIN regiones r ON r.id_region  = c.id_region
ORDER BY utilidad_bruta DESC;