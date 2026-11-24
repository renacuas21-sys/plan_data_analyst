WITH estado_resultados AS (
    SELECT
        anio,
        escenario,
        SUM(CASE WHEN tipo = 'Ingreso'
            THEN importe_mxn ELSE 0 END) AS ingresos,
        SUM(CASE WHEN tipo = 'Costo'
            THEN importe_mxn ELSE 0 END) AS costos,
        SUM(CASE WHEN tipo = 'Gasto'
            THEN importe_mxn ELSE 0 END) AS gastos
    FROM vw_finanzas
    GROUP BY anio, escenario
)
SELECT
    anio,
    escenario,
    ingresos,
    costos,
    ingresos - costos AS utilidad_bruta,
    gastos,
    ingresos - costos - gastos AS ebitda,
    ROUND(
        (ingresos - costos - gastos) * 100.0
        / NULLIF(ingresos, 0), 2
    ) AS margen_ebitda
FROM estado_resultados
ORDER BY anio, escenario;

