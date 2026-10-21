-- UNIDAD 2 | BLOQUE 3
-- Practica: JOIN y cardinalidad

CREATE TABLE clientes (
    id_cliente INTEGER PRIMARY KEY,
    nombre VARCHAR(50)
);

CREATE TABLE movimientos (
    id_mov INTEGER PRIMARY KEY,
    id_cliente INTEGER,
    importe NUMERIC(12,2),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

INSERT INTO clientes (id_cliente, nombre)
VALUES
    (1, 'Ana'),
    (2, 'Luis'),
    (3, 'Pedro');

    INSERT INTO movimientos (id_mov, id_cliente, importe)
VALUES
    (101, 1, 5000),
    (102, 1, 3000),
    (103, 2, 7000);

    -- Ejercicio 1: Relacionar clientes con sus movimientos

SELECT
    c.nombre,
    m.id_mov,
    m.importe
FROM clientes AS c
INNER JOIN movimientos AS m
    ON c.id_cliente = m.id_cliente;

    -- Ejercicio 2: Mostrar todos los clientes,
-- incluyendo aquellos sin movimientos.

SELECT
    c.nombre,
    m.id_mov,
    m.importe
FROM clientes AS c
LEFT JOIN movimientos AS m
    ON c.id_cliente = m.id_cliente;

    -- Ejercicio 3: Identificar clientes sin movimientos

SELECT
    c.nombre,
    m.id_mov,
    m.importe
FROM clientes AS c
LEFT JOIN movimientos AS m
    ON c.id_cliente = m.id_cliente
WHERE m.id_mov IS NULL;

-- Ejercicio 4: Contar filas, movimientos reales y clientes distintos

SELECT
    COUNT(*) AS total_filas,
    COUNT(m.id_mov) AS total_movimientos,
    COUNT(DISTINCT c.id_cliente) AS total_clientes
FROM clientes AS c
LEFT JOIN movimientos AS m
    ON c.id_cliente = m.id_cliente;

    -- Ejercicio 5: Contar movimientos por cliente

    SELECT
    c.nombre,
    COUNT(m.id_mov) AS total_movimientos
FROM clientes AS c
LEFT JOIN movimientos AS m
    ON c.id_cliente = m.id_cliente
GROUP BY c.id_cliente;

-- Ejercicio 6: Multiplicacion de filas por cardinalidad
-- Caso: 3 movimientos y 2 telefonos del mismo cliente.
-- Un JOIN por id_cliente puede producir 6 filas.
-- Esto no significa que existan 6 movimientos reales.
-- Si usamos SUM(importe) despues del JOIN,
-- podemos duplicar incorrectamente el importe total.
-- Antes de eliminar registros, revisar las relaciones
-- y comprobar los movimientos originales.

CREATE TABLE telefonos (
    id_telefono INTEGER PRIMARY KEY,
    id_cliente INTEGER,
    telefono VARCHAR(20),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

INSERT INTO telefonos (id_telefono, id_cliente, telefono)
VALUES
    (1, 1, '3311111111'),
    (2, 1, '3322222222');

    -- Ejercicio 6: Comprobar multiplicacion de filas

SELECT
    m.id_mov,
    m.importe,
    t.telefono
FROM movimientos AS m
INNER JOIN telefonos AS t
    ON m.id_cliente = t.id_cliente;

    -- Ejercicio 7: Detectar multiplicacion de filas

SELECT
    COUNT(*) AS total_filas,
    COUNT(DISTINCT m.id_mov) AS movimientos_unicos
FROM movimientos AS m
INNER JOIN telefonos AS t
    ON m.id_cliente = t.id_cliente;

    