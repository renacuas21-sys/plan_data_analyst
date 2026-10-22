SELECT
    id_venta,
    estado,
    unidades,
    CASE
        WHEN unidades IS NULL THEN 'Dato faltante'
        WHEN unidades < 0 THEN 'Cantidad negativa'
        WHEN unidades = 0 THEN 'Revisar cantidad cero'
        ELSE 'Cantidad registrada'
    END AS estado_calidad_unidades
FROM ventas;

-- PRUEBA DE VALIDACION - BLOQUE 4
-- Motor utilizado: SQLite Online
-- Registros evaluados: 4
--
-- Venta 1001: Cantidad registrada
-- Venta 1007: Dato faltante
-- Venta 1010: Revisar cantidad cero
-- Venta 1011: Cantidad negativa
--
-- Resultado: Las cuatro clasificaciones fueron correctas.
-- La consulta no modifica los datos originales.
--
-- Nota: Las ventas 1010 y 1011 son casos de prueba
-- creados para verificar cantidades cero y negativas.

-- REPORTE DE INCIDENCIAS - BLOQUE 4
-- Identifica registros con unidades faltantes,
-- iguales a cero o negativas.

SELECT
    id_venta,
    estado,
    unidades,
    CASE
        WHEN unidades IS NULL THEN 'Dato faltante'
        WHEN unidades < 0 THEN 'Cantidad negativa'
        WHEN unidades = 0 THEN 'Revisar cantidad cero'
    END AS tipo_incidencia
FROM ventas
WHERE unidades IS NULL
   OR unidades <= 0;

   -- KPI DE CALIDAD DE DATOS - BLOQUE 4
-- Calcula el porcentaje de registros con incidencias
-- en el campo unidades.
-- Prueba realizada en SQLite Online:
-- 4 registros, 3 con incidencia, resultado 75%.
-- Datos de laboratorio, no indicadores reales de negocio.

