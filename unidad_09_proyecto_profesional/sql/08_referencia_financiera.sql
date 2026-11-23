SELECT
    ROUND(
        SUM(cantidad * precio_unitario), 2
    ) AS ventas_totales,

    ROUND(
        SUM(cantidad * costo_unitario_venta), 2
    ) AS costo_total,

    ROUND(
        SUM(
            cantidad * (precio_unitario - costo_unitario_venta)
        ), 2
    ) AS utilidad_bruta

FROM detalle_ventas;

