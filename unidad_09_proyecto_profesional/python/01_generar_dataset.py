
import csv
from pathlib import Path

# Carpeta raíz del proyecto
BASE_DIR = Path(__file__).resolve().parent.parent
OUTPUT_DIR = BASE_DIR / "data" / "raw"

OUTPUT_DIR.mkdir(parents=True, exist_ok=True)

regiones = [
    (1, "Norte", "Gerencia Norte"),
    (2, "Centro", "Gerencia Centro"),
    (3, "Sur", "Gerencia Sur"),
]

archivo = OUTPUT_DIR / "regiones.csv"

with archivo.open("w", newline="", encoding="utf-8") as f:
    writer = csv.writer(f)
    writer.writerow(["id_region", "nombre_region", "responsable"])
    writer.writerows(regiones)

print(f"Archivo generado: {archivo}")
print(f"Registros: {len(regiones)}")


import random

random.seed(42)

segmentos = ["Minorista", "PyME", "Corporativo"]
clientes = []

for id_cliente in range(1, 301):
    nombre = f"Cliente_{id_cliente:03d}"
    segmento = random.choice(segmentos)
    id_region = random.randint(1, 3)

    clientes.append((
        id_cliente,
        nombre,
        segmento,
        id_region
    ))

archivo_clientes = OUTPUT_DIR / "clientes.csv"

with archivo_clientes.open("w", newline="", encoding="utf-8") as f:
    writer = csv.writer(f)
    writer.writerow([
        "id_cliente",
        "nombre",
        "segmento",
        "id_region"
    ])
    writer.writerows(clientes)

print(f"Clientes generados: {len(clientes)}")


categorias = [
    "Computo",
    "Accesorios",
    "Oficina",
    "Electronica"
]

productos = []

for id_producto in range(1, 41):
    categoria = categorias[(id_producto - 1) % 4]
    nombre_producto = f"Producto_{id_producto:03d}"
    costo_unitario = round(random.uniform(150, 12000), 2)

    productos.append((
        id_producto,
        nombre_producto,
        categoria,
        costo_unitario
    ))

archivo_productos = OUTPUT_DIR / "productos.csv"

with archivo_productos.open("w", newline="", encoding="utf-8") as f:
    writer = csv.writer(f)
    writer.writerow([
        "id_producto",
        "nombre_producto",
        "categoria",
        "costo_unitario"
    ])
    writer.writerows(productos)

print(f"Productos generados: {len(productos)}")


from datetime import date, timedelta

ventas = []
detalle_ventas = []

fecha_inicio = date(2025, 1, 1)
dias_periodo = 365

# Relación entre cliente y región
region_por_cliente = {
    cliente[0]: cliente[3]
    for cliente in clientes
}

# Relación entre producto y costo de catálogo
costo_por_producto = {
    producto[0]: producto[3]
    for producto in productos
}

id_detalle = 1

for id_venta in range(1, 3001):
    id_cliente = random.randint(1, 300)
    id_region = region_por_cliente[id_cliente]

    fecha_venta = fecha_inicio + timedelta(
        days=random.randrange(dias_periodo)
    )

    ventas.append((
        id_venta,
        id_cliente,
        id_region,
        fecha_venta.isoformat()
    ))

    cantidad_productos = random.randint(1, 4)

    # Productos distintos dentro de una operación
    productos_venta = random.sample(
        range(1, 41),
        cantidad_productos
    )

    for id_producto in productos_venta:
        cantidad = random.randint(1, 5)

        costo_base = costo_por_producto[id_producto]

        # Variación histórica del costo: +/- 10%
        costo_historico = round(
            costo_base * random.uniform(0.90, 1.10),
            2
        )

        # Margen comercial variable
        precio_unitario = round(
            costo_historico * random.uniform(1.15, 1.65),
            2
        )

        detalle_ventas.append((
            id_detalle,
            id_venta,
            id_producto,
            cantidad,
            precio_unitario,
            costo_historico
        ))

        id_detalle += 1


def guardar_csv(nombre_archivo, encabezados, registros):
    ruta = OUTPUT_DIR / nombre_archivo

    with ruta.open(
        "w",
        newline="",
        encoding="utf-8"
    ) as archivo:
        writer = csv.writer(archivo)
        writer.writerow(encabezados)
        writer.writerows(registros)

    print(f"{nombre_archivo}: {len(registros)} registros")


guardar_csv(
    "ventas.csv",
    ["id_venta", "id_cliente", "id_region", "fecha_venta"],
    ventas
)

guardar_csv(
    "detalle_ventas.csv",
    [
        "id_detalle",
        "id_venta",
        "id_producto",
        "cantidad",
        "precio_unitario",
        "costo_unitario_venta"
    ],
    detalle_ventas
)

