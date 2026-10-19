SELECT *
FROM (
    SELECT
        cliente,
        ROUND(
            SUM(importe) * 100.0 /
            (
                SELECT SUM(importe)
                FROM ventas_clientes
                WHERE estado = 'Completada'
            ), 2
        ) AS porcentaje_total
    FROM ventas_clientes
    WHERE estado = 'Completada'
    GROUP BY cliente
) AS resumen
WHERE porcentaje_total > 30;