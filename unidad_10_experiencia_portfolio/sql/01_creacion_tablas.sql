-- GRUPO NOVA | UNIDAD 10
-- Creación del modelo financiero
-- PostgreSQL

CREATE TABLE unidades (
    unidad_id VARCHAR(10) PRIMARY KEY,
    unidad VARCHAR(100) NOT NULL
);

CREATE TABLE centros (
    centro_id VARCHAR(10) PRIMARY KEY,
    centro VARCHAR(100) NOT NULL
);

CREATE TABLE cuentas (
    cuenta_id VARCHAR(10) PRIMARY KEY,
    cuenta VARCHAR(100) NOT NULL,
    tipo VARCHAR(20) NOT NULL,
    CHECK (tipo IN ('Ingreso', 'Costo', 'Gasto'))
);

CREATE TABLE movimientos (
    movimiento_id VARCHAR(20) PRIMARY KEY,
    mes DATE NOT NULL,
    unidad_id VARCHAR(10) NOT NULL,
    centro_id VARCHAR(10) NOT NULL,
    cuenta_id VARCHAR(10) NOT NULL,
    componente INTEGER NOT NULL,
    escenario VARCHAR(20) NOT NULL,
    importe_mxn BIGINT NOT NULL,

    FOREIGN KEY (unidad_id) REFERENCES unidades(unidad_id),
    FOREIGN KEY (centro_id) REFERENCES centros(centro_id),
    FOREIGN KEY (cuenta_id) REFERENCES cuentas(cuenta_id),

    CHECK (componente IN (1, 2)),
    CHECK (escenario IN ('Real', 'Presupuesto'))
);

