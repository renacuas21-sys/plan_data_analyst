WITH resultados AS (
    SELECT
        mes,
        unidad,
        escenario,
        SUM(CASE WHEN tipo = 'Ingreso'
            THEN importe_mxn ELSE 0 END) AS ingresos,
        SUM(CASE WHEN tipo = 'Costo'
            THEN importe_mxn ELSE 0 END) AS costos,
        SUM(CASE WHEN tipo = 'Gasto'
            THEN importe_mxn ELSE 0 END) AS gastos
    FROM vw_finanzas
    WHERE unidad IN ('Logistica', 'Distribucion')
    GROUP BY mes, unidad, escenario
)
SELECT
    mes,
    unidad,
    escenario,
    ingresos,
    costos,
    gastos,
    ingresos - costos AS utilidad_bruta,
    ingresos - costos - gastos AS ebitda,
    ROUND(
        (ingresos - costos - gastos) * 100.0
        / NULLIF(ingresos, 0), 2
    ) AS margen_ebitda
FROM resultados
ORDER BY mes, unidad, escenario;

