CREATE OR REPLACE VIEW vw_finanzas AS
SELECT
    m.movimiento_id,
    m.mes,
    EXTRACT(YEAR FROM m.mes)::INTEGER AS anio,
    EXTRACT(MONTH FROM m.mes)::INTEGER AS numero_mes,
    m.unidad_id,
    u.unidad,
    m.centro_id,
    ce.centro,
    m.cuenta_id,
    c.cuenta,
    c.tipo,
    m.componente,
    m.escenario,
    m.importe_mxn
FROM movimientos m
INNER JOIN unidades u
    ON m.unidad_id = u.unidad_id
INNER JOIN centros ce
    ON m.centro_id = ce.centro_id
INNER JOIN cuentas c
    ON m.cuenta_id = c.cuenta_id;

    