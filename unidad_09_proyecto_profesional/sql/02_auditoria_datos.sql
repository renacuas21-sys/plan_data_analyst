
SELECT
    COUNT(*) AS total_lineas,
    COUNT(DISTINCT id_venta) AS ventas_con_detalle,
    SUM(cantidad) AS unidades_vendidas,
    COUNT(*) FILTER (
        WHERE costo_unitario_venta IS NULL
    ) AS costos_faltantes,
    COUNT(*) FILTER (
        WHERE precio_unitario < costo_unitario_venta
    ) AS lineas_con_perdida
FROM detalle_ventas;


SELECT
    ROUND(
        SUM(cantidad * precio_unitario), 2
    ) AS ventas_totales,

    ROUND(
        SUM(cantidad * costo_unitario_venta), 2
    ) AS costo_mercancia,

    ROUND(
        SUM(
            cantidad *
            (precio_unitario - costo_unitario_venta)
        ), 2
    ) AS utilidad_bruta
FROM detalle_ventas;


