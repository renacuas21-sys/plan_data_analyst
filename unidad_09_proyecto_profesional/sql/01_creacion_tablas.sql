
CREATE TABLE clientes (
    id_cliente INTEGER PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    segmento VARCHAR(30) NOT NULL,
    id_region INTEGER NOT NULL
    REFERENCES regiones(id_region)
);

CREATE TABLE productos (
    id_producto INTEGER PRIMARY KEY,
    nombre_producto VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    costo_unitario NUMERIC(12,2) NOT NULL
);


CREATE TABLE regiones (
    id_region INTEGER PRIMARY KEY,
    nombre_region VARCHAR(50) NOT NULL,
    responsable VARCHAR(100)
);

CREATE TABLE ventas (
    id_venta INTEGER PRIMARY KEY,
    id_cliente INTEGER NOT NULL,
    id_region INTEGER NOT NULL,
    fecha_venta DATE NOT NULL,

    CONSTRAINT fk_venta_cliente
        FOREIGN KEY (id_cliente)
        REFERENCES clientes(id_cliente),

    CONSTRAINT fk_venta_region
        FOREIGN KEY (id_region)
        REFERENCES regiones(id_region)
);

CREATE TABLE detalle_ventas (
    id_detalle INTEGER PRIMARY KEY,
    id_venta INTEGER NOT NULL,
    id_producto INTEGER NOT NULL,
    cantidad INTEGER NOT NULL CHECK (cantidad > 0),
    precio_unitario NUMERIC(12,2) NOT NULL
        CHECK (precio_unitario >= 0),

    CONSTRAINT fk_detalle_venta
        FOREIGN KEY (id_venta)
        REFERENCES ventas(id_venta),

    CONSTRAINT fk_detalle_producto
        FOREIGN KEY (id_producto)
        REFERENCES productos(id_producto)
);


-- UNIDAD 9
-- Proyecto: Distribuidora Occidente
-- Creación del modelo relacional

CREATE TABLE regiones (
    id_region INTEGER PRIMARY KEY,
    nombre_region VARCHAR(50) NOT NULL,
    responsable VARCHAR(100)
);

CREATE TABLE clientes (
    id_cliente INTEGER PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    segmento VARCHAR(30) NOT NULL,
    id_region INTEGER NOT NULL
        REFERENCES regiones(id_region)
);

CREATE TABLE productos (
    id_producto INTEGER PRIMARY KEY,
    nombre_producto VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    costo_unitario NUMERIC(12,2) NOT NULL
        CHECK (costo_unitario >= 0)
);

CREATE TABLE ventas (
    id_venta INTEGER PRIMARY KEY,
    id_cliente INTEGER NOT NULL
        REFERENCES clientes(id_cliente),
    id_region INTEGER NOT NULL
        REFERENCES regiones(id_region),
    fecha_venta DATE NOT NULL
);

CREATE TABLE detalle_ventas (
    id_detalle INTEGER PRIMARY KEY,
    id_venta INTEGER NOT NULL
        REFERENCES ventas(id_venta),
    id_producto INTEGER NOT NULL
        REFERENCES productos(id_producto),
    cantidad INTEGER NOT NULL
        CHECK (cantidad > 0),
    precio_unitario NUMERIC(12,2) NOT NULL
        CHECK (precio_unitario >= 0)
);


