-- CONSULTA 25: Participación acumulada por sucursal

WITH ventas_sucursal AS (
    SELECT
        s.nombre_sucursal,
        SUM(f.importe) AS ingresos_totales
    FROM modelo_ventas.fact_sales AS f
    INNER JOIN modelo_ventas.dim_branch AS s
        ON f.id_sucursal = s.id_sucursal
    GROUP BY s.id_sucursal, s.nombre_sucursal
)
SELECT
    nombre_sucursal,
    ingresos_totales,
    ROUND(
        ingresos_totales * 100.0
        / NULLIF(SUM(ingresos_totales) OVER (), 0),
        2
    ) AS participacion_pct,
    ROUND(
        SUM(ingresos_totales) OVER (
            ORDER BY ingresos_totales DESC, nombre_sucursal
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ) * 100.0
        / NULLIF(SUM(ingresos_totales) OVER (), 0),
        2
    ) AS participacion_acumulada_pct
FROM ventas_sucursal
ORDER BY ingresos_totales DESC, nombre_sucursal;