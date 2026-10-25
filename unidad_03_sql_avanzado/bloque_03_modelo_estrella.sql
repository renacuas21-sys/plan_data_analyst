-- PLAN PARA DATA ANALYST
-- UNIDAD 3 | BLOQUE 3
-- MODELO ESTRELLA DE VENTAS
-- Base de datos: plan_data_analyst
-- Esquema: modelo_ventas
--
-- Granularidad: una fila por linea de venta.
-- Un ticket puede contener varias lineas.
--
-- ATENCION:
-- Script para reconstruir el modelo en una base
-- de datos nueva. No ejecutarlo nuevamente sobre
-- las tablas que ya contienen datos.

CREATE SCHEMA IF NOT EXISTS modelo_ventas;

-- 1. DIMENSION CLIENTES

CREATE TABLE modelo_ventas.dim_customer (
    id_cliente INTEGER PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

INSERT INTO modelo_ventas.dim_customer
    (id_cliente, nombre)
VALUES
    (1, 'Ana'),
    (2, 'Luis'),
    (3, 'Pedro');


-- 2. DIMENSION PRODUCTOS

CREATE TABLE modelo_ventas.dim_product (
    id_producto INTEGER PRIMARY KEY,
    nombre_producto VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL
);

INSERT INTO modelo_ventas.dim_product
    (id_producto, nombre_producto, categoria)
VALUES
    (1, 'Laptop', 'Computadoras'),
    (2, 'Mouse', 'Accesorios'),
    (3, 'Monitor', 'Monitores'),
    (4, 'Teclado', 'Accesorios');


-- 3. DIMENSION SUCURSALES

CREATE TABLE modelo_ventas.dim_branch (
    id_sucursal INTEGER PRIMARY KEY,
    nombre_sucursal VARCHAR(100) NOT NULL,
    region VARCHAR(50) NOT NULL
);

INSERT INTO modelo_ventas.dim_branch
    (id_sucursal, nombre_sucursal, region)
VALUES
    (1, 'Centro', 'Centro'),
    (2, 'Norte', 'Norte'),
    (3, 'Sur', 'Sur');


-- 4. DIMENSION FECHAS

CREATE TABLE modelo_ventas.dim_date (
    id_fecha INTEGER PRIMARY KEY,
    fecha DATE NOT NULL,
    anio INTEGER NOT NULL,
    mes INTEGER NOT NULL,
    dia INTEGER NOT NULL
);

INSERT INTO modelo_ventas.dim_date
    (id_fecha, fecha, anio, mes, dia)
VALUES
    (20260930, '2026-09-30', 2026, 9, 30),
    (20261001, '2026-10-01', 2026, 10, 1),
    (20261002, '2026-10-02', 2026, 10, 2),
    (20261003, '2026-10-03', 2026, 10, 3);


-- 5. TABLA DE HECHOS: VENTAS

CREATE TABLE modelo_ventas.fact_sales (
    id_linea_venta INTEGER PRIMARY KEY,
    id_ticket VARCHAR(20) NOT NULL,
    id_cliente INTEGER NOT NULL,
    id_producto INTEGER NOT NULL,
    id_sucursal INTEGER NOT NULL,
    id_fecha INTEGER NOT NULL,
    unidades INTEGER NOT NULL CHECK (unidades > 0),
    importe NUMERIC(12,2) NOT NULL CHECK (importe >= 0),

    FOREIGN KEY (id_cliente)
        REFERENCES modelo_ventas.dim_customer(id_cliente),

    FOREIGN KEY (id_producto)
        REFERENCES modelo_ventas.dim_product(id_producto),

    FOREIGN KEY (id_sucursal)
        REFERENCES modelo_ventas.dim_branch(id_sucursal),

    FOREIGN KEY (id_fecha)
        REFERENCES modelo_ventas.dim_date(id_fecha)
);


-- 6. DATOS DE PRUEBA

INSERT INTO modelo_ventas.fact_sales
    (id_linea_venta, id_ticket, id_cliente,
     id_producto, id_sucursal, id_fecha,
     unidades, importe)
VALUES
    (101, 'T-001', 1, 1, 1, 20261001, 1, 15000),
    (102, 'T-001', 1, 2, 1, 20261001, 2, 1000),
    (103, 'T-002', 2, 3, 2, 20261001, 1, 4000),
    (104, 'T-003', 1, 1, 2, 20261002, 2, 30000),
    (105, 'T-004', 3, 4, 3, 20261002, 3, 4500);

    