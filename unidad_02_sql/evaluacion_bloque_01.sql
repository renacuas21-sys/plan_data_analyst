-- PLAN PARA DATA ANALYST
-- UNIDAD 2 | BLOQUE 1
-- EVALUACION PRACTICA DE FUNDAMENTOS SQL
-- Fecha: 18 de octubre de 2026
--
-- Objetivo:
-- Aplicar SELECT, WHERE, JOIN, GROUP BY,
-- HAVING, ORDER BY y funciones de agregacion
-- para responder preguntas de negocio.
--
-- Herramienta de aprendizaje: SQLBolt
-- Estado: Evaluacion realizada; evidencia en preparacion.

-- ==================================================
-- EJERCICIO 1: INGRESOS POR CIUDAD
-- ==================================================
-- Pregunta de negocio:
-- ¿Cuanto hemos vendido en cada ciudad?
-- Incluir ciudades sin ventas, mostrando cero.

SELECT
    clientes.ciudad,
    COALESCE(SUM(ventas.importe), 0) AS total_operado
FROM clientes
LEFT JOIN ventas
    ON clientes.id_cliente = ventas.id_cliente
GROUP BY clientes.ciudad
ORDER BY total_operado DESC;

-- ==================================================
-- EJERCICIO 2: VENTAS COMPLETADAS POR VENDEDOR
-- ==================================================
-- Pregunta de negocio:
-- ¿Que vendedores superaron los $30,000
-- en ventas completadas?
-- Excluir operaciones canceladas.

SELECT
    vendedor,
    SUM(importe) AS ingresos_totales
FROM ventas
WHERE estado = 'Completada'
GROUP BY vendedor
HAVING SUM(importe) > 30000
ORDER BY ingresos_totales DESC;

