WITH movimientos_comparados AS (
    SELECT
        id_mov,
        id_cliente,
        importe,
        LAG(importe) OVER (
            PARTITION BY id_cliente
            ORDER BY id_mov
        ) AS importe_anterior
    FROM practica_bloque_03.movimientos
)
SELECT
    id_mov,
    id_cliente,
    importe,
    importe_anterior,
    ROUND(
        (importe - importe_anterior)
        * 100.0 / NULLIF(importe_anterior, 0),
        2
    ) AS variacion_porcentual
FROM movimientos_comparados
ORDER BY id_cliente, id_mov;