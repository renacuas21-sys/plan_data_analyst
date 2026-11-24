WITH comparativo AS (
    SELECT
        unidad,
        tipo,
        cuenta,
        SUM(CASE WHEN escenario = 'Real'
            THEN importe_mxn ELSE 0 END) AS real,
        SUM(CASE WHEN escenario = 'Presupuesto'
            THEN importe_mxn ELSE 0 END) AS presupuesto
    FROM vw_finanzas
    WHERE anio = 2025
      AND unidad_id IN (
          SELECT unidad_id
          FROM unidades
          WHERE unidad IN ('Logistica', 'Distribucion')
      )
    GROUP BY unidad, tipo, cuenta
)
SELECT
    unidad,
    tipo,
    cuenta,
    real,
    presupuesto,
    real - presupuesto AS desviacion,
    ROUND(
        (real - presupuesto) * 100.0
        / NULLIF(presupuesto, 0), 2
    ) AS desviacion_pct,
    CASE
        WHEN tipo = 'Ingreso'
            THEN real - presupuesto
        ELSE presupuesto - real
    END AS impacto_ebitda
FROM comparativo
ORDER BY impacto_ebitda ASC;

