SELECT
    id_cliente,
    COUNT(*) AS total_movimientos,
    SUM(importe) AS total_operado
FROM practica_bloque_03.movimientos
GROUP BY id_cliente
ORDER BY id_cliente;