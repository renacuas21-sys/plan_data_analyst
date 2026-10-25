-- =====================================================
-- PLAN PARA DATA ANALYST
-- UNIDAD 3 - BLOQUE 4
-- ENTREGABLE: 25 CONSULTAS SQL
-- =====================================================

-- Objetivo:
-- Construir, ejecutar y validar 25 consultas SQL
-- que respondan preguntas de negocio y permitan
-- comprobar la calidad de los datos.

-- Base de datos: plan_data_analyst
-- Modelo principal: modelo_ventas
-- Motor: PostgreSQL

-- =====================================================
-- SECCION 1: EXPLORACION Y CALIDAD DE DATOS
-- =====================================================

-- CONSULTA 01
-- Pregunta de negocio:
-- ¿Cuántas líneas de venta, tickets únicos,
-- unidades e ingresos contiene nuestro modelo?

SELECT
    COUNT(*) AS lineas_venta,
    COUNT(DISTINCT id_ticket) AS tickets_unicos,
    SUM(unidades) AS unidades_vendidas,
    SUM(importe) AS importe_total
FROM modelo_ventas.fact_sales;

-- CONSULTA 02
-- Pregunta:
-- ¿Cuántas líneas de venta contiene cada ticket?

SELECT
    id_ticket,
    COUNT(*) AS lineas_por_ticket,
    SUM(unidades) AS unidades_por_ticket,
    SUM(importe) AS importe_por_ticket
FROM modelo_ventas.fact_sales
GROUP BY id_ticket
ORDER BY lineas_por_ticket DESC, id_ticket;

