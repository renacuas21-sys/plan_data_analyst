SELECT 'unidades' AS tabla, COUNT(*) AS registros
FROM unidades

UNION ALL

SELECT 'centros', COUNT(*)
FROM centros

UNION ALL

SELECT 'cuentas', COUNT(*)
FROM cuentas

UNION ALL

SELECT 'movimientos', COUNT(*)
FROM movimientos;

