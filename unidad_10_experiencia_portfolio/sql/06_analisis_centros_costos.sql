WITH comparativo AS (
    SELECT
        unidad,
        centro,
        tipo,
        SUM(CASE WHEN escenario = 'Real'
            THEN importe_mxn ELSE 0 END) AS real,
        SUM(CASE WHEN escenario = 'Presupuesto'
            THEN importe_mxn ELSE 0 END) AS presupuesto
    FROM vw_finanzas
    WHERE anio = 2025
      AND unidad IN ('Logistica', 'Distribucion')
      AND tipo IN ('Costo', 'Gasto')
    GROUP BY unidad, centro, tipo
)
SELECT
    unidad,
    centro,
    tipo,
    real,
    presupuesto,
    real - presupuesto AS sobrecosto,
    ROUND(
        (real - presupuesto) * 100.0
        / NULLIF(presupuesto, 0), 2
    ) AS desviacion_pct
FROM comparativo
ORDER BY sobrecosto DESC;

