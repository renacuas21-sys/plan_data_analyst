-- =====================================================
-- PLAN PARA DATA ANALYST
-- UNIDAD 2: SQL
-- BLOQUE 2: ANALISIS DE DATOS CON SQL
-- Fecha: 18 de octubre de 2026
-- =====================================================

-- OBJETIVO:
-- Aplicar funciones de agregacion, filtros,
-- agrupaciones y clasificaciones para responder
-- preguntas de negocio mediante SQL.

-- HERRAMIENTAS PRACTICADAS:
-- SELECT, FROM, WHERE, GROUP BY, HAVING, ORDER BY
-- COUNT(), SUM(), AVG(), CASE y AS

-- EVALUACION INTEGRADORA:
-- Cinco casos de analisis comercial.

-- NOTA:
-- Las consultas se documentan con datos de practica.
-- Los resultados deberan validarse mediante ejecucion
-- en un motor SQL.

-- =====================================================
-- CASO 1: CLIENTES CON MAYOR VOLUMEN DE VENTAS
-- =====================================================

-- PREGUNTA DE NEGOCIO:
-- ¿Que clientes acumulan mas de $10,000 en ventas
-- completadas y cuantas operaciones realizaron?

-- CONSULTA SQL:

SELECT
    cliente,
    COUNT(*) AS cantidad_ventas,
    SUM(importe) AS total_vendido
FROM ventas
WHERE estado = 'Completada'
GROUP BY cliente
HAVING SUM(importe) > 10000
ORDER BY total_vendido DESC;

-- RESULTADO ESPERADO:
-- Ana: 2 ventas, $18,000.
-- Pedro: 1 venta, $12,000.

-- INTERPRETACION DE NEGOCIO:
-- Ana es la cliente con mayor facturacion acumulada.
-- Pedro tambien supera el umbral establecido.
-- Luis no cumple la condicion de ventas acumuladas.

-- ESTADO:
-- Logica revisada; pendiente de ejecucion en motor SQL.

-- =====================================================
-- CASO 2: CLIENTES CON MAYOR TICKET PROMEDIO
-- =====================================================

-- PREGUNTA DE NEGOCIO:
-- ¿Que clientes tienen un ticket promedio superior
-- a $8,000 en sus ventas completadas?

-- CONSULTA SQL:

SELECT
    cliente,
    COUNT(*) AS cantidad_ventas,
    AVG(importe) AS ticket_promedio
FROM ventas
WHERE estado = 'Completada'
GROUP BY cliente
HAVING AVG(importe) > 8000
ORDER BY ticket_promedio DESC;

-- RESULTADO ESPERADO:
-- Pedro: 1 venta, ticket promedio $12,000.
-- Ana: 2 ventas, ticket promedio $9,000.

-- INTERPRETACION DE NEGOCIO:
-- Pedro tiene el mayor ticket promedio, aunque
-- Ana genera mayores ingresos acumulados.
-- Esto demuestra que ticket promedio y facturacion
-- total son indicadores diferentes.

-- ESTADO:
-- Logica revisada; pendiente de ejecucion en motor SQL.

-- =====================================================
-- CASO 3: CLASIFICACION DE CLIENTES POR VALOR
-- =====================================================

-- PREGUNTA DE NEGOCIO:
-- ¿Como podemos clasificar a los clientes segun
-- el importe acumulado de sus ventas completadas?
--
-- Alto valor: $15,000 o mas.
-- Valor medio: desde $8,000 hasta menos de $15,000.
-- Bajo valor: menos de $8,000.

-- CONSULTA SQL:

SELECT
    cliente,
    SUM(importe) AS total_vendido,
    CASE
        WHEN SUM(importe) >= 15000 THEN 'Alto valor'
        WHEN SUM(importe) >= 8000 THEN 'Valor medio'
        ELSE 'Bajo valor'
    END AS clasificacion
FROM ventas
WHERE estado = 'Completada'
GROUP BY cliente
ORDER BY total_vendido DESC;

-- RESULTADO ESPERADO:
-- Ana: $18,000 - Alto valor.
-- Pedro: $12,000 - Valor medio.
-- Luis: $6,000 - Bajo valor.

-- INTERPRETACION DE NEGOCIO:
-- Ana pertenece al segmento de alto valor y podria
-- considerarse para estrategias de fidelizacion.
-- Pedro pertenece al segmento medio y presenta
-- oportunidades de crecimiento comercial.
-- Luis pertenece al segmento bajo, aunque se
-- requiere mas informacion antes de recomendar acciones.

-- ESTADO:
-- Logica revisada; pendiente de ejecucion en motor SQL.

-- =====================================================
-- CASO 4: CLIENTES CON ALTO VOLUMEN Y TICKET PROMEDIO
-- =====================================================

-- PREGUNTA DE NEGOCIO:
-- ¿Que clientes acumulan al menos $10,000 en ventas
-- completadas y tienen un ticket promedio mayor
-- a $8,000?

-- CONSULTA SQL:

SELECT
    cliente,
    COUNT(*) AS cantidad_ventas,
    SUM(importe) AS total_vendido,
    AVG(importe) AS ticket_promedio
FROM ventas
WHERE estado = 'Completada'
GROUP BY cliente
HAVING SUM(importe) >= 10000
   AND AVG(importe) > 8000
ORDER BY total_vendido DESC;

-- RESULTADO ESPERADO:
-- Ana: 2 ventas, $18,000, ticket promedio $9,000.
-- Pedro: 1 venta, $12,000, ticket promedio $12,000.

-- INTERPRETACION DE NEGOCIO:
-- Ana y Pedro cumplen simultaneamente los dos
-- criterios comerciales establecidos.
-- Ana genera mayores ingresos acumulados,
-- mientras Pedro tiene un ticket promedio superior.
-- Luis queda excluido por no cumplir los umbrales.

-- ESTADO:
-- Logica revisada; pendiente de ejecucion en motor SQL.

-- =====================================================
-- CASO 5: INGRESOS POR CATEGORIA DE PRODUCTO
-- =====================================================

-- PREGUNTA DE NEGOCIO:
-- ¿Que categorias generan mas de $20,000
-- en ventas completadas?
-- ¿Cuantas operaciones registran y cual es
-- su ticket promedio?

-- CONSULTA SQL:

SELECT
    categoria,
    COUNT(*) AS cantidad_ventas,
    SUM(importe) AS ingresos_totales,
    AVG(importe) AS ticket_promedio
FROM ventas
WHERE estado = 'Completada'
GROUP BY categoria
HAVING SUM(importe) > 20000
ORDER BY ingresos_totales DESC;

-- RESULTADO ESPERADO:
-- Laptop: 4 ventas, $70,000 de ingresos,
-- ticket promedio de $17,500.

-- INTERPRETACION DE NEGOCIO:
-- Laptop es la unica categoria que supera
-- el umbral de $20,000 en ventas completadas.
-- Monitor acumula $16,000 y queda excluida.
-- Teclado no registra ventas completadas
-- en los datos de este ejercicio.

-- CONCLUSION:
-- La categoria Laptop concentra los mayores
-- ingresos de la muestra analizada.
-- Antes de recomendar acciones comerciales,
-- seria conveniente revisar costos, margenes
-- y periodos adicionales.

-- ESTADO:
-- Logica revisada; pendiente de ejecucion en motor SQL.

-- ESTADO:
-- Consulta validada mediante ejecucion en PostgreSQL 18.

