
SELECT
    p.id_producto,
    p.nombre_producto,
    p.categoria,

    SUM(d.cantidad) AS unidades_vendidas,

    ROUND(
        SUM(d.cantidad * d.precio_unitario), 2
    ) AS ventas_totales,

    ROUND(
        SUM(d.cantidad * d.costo_unitario_venta), 2
    ) AS costo_total,

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
        ) /
        NULLIF(
            SUM(d.cantidad * d.precio_unitario),
            0
        ),
        2
    ) AS margen_bruto_pct

FROM productos p
JOIN detalle_ventas d
    ON p.id_producto = d.id_producto

GROUP BY
    p.id_producto,
    p.nombre_producto,
    p.categoria

ORDER BY utilidad_bruta DESC;
