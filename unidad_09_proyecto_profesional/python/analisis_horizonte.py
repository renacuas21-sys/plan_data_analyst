
import pandas as pd

# 1. Cargar los datos exportados desde PostgreSQL
df = pd.read_csv("comercializadora_horizonte_analisis.csv")

# 2. Revisar estructura
print("DIMENSIONES DEL DATASET")
print(df.shape)

print("\nCOLUMNAS")
print(df.columns.tolist())

print("\nPRIMEROS CINCO REGISTROS")
print(df.head())

# 3. Revisar estatus
print("\nREGISTROS POR ESTATUS")
print(df["estatus"].value_counts())

# 4. Filtrar ventas completadas
ventas = df[df["estatus"] == "Completada"].copy()

# 5. Calcular indicadores
print("\nINDICADORES FINANCIEROS")

print("Ventas completadas:", ventas["venta_id"].nunique())
print("Unidades vendidas:", ventas["cantidad"].sum())
print("Ingresos:", ventas["ingresos"].sum())
print("Costo registrado:", ventas["costo_registrado_total"].sum())
print("Costo referencial:", ventas["costo_referencial_total"].sum())
print("Utilidad referencial:", ventas["utilidad_referencial"].sum())


from pathlib import Path

# Carpeta de salida para los indicadores
salida = Path("../data/processed")
salida.mkdir(parents=True, exist_ok=True)

# Rentabilidad por canal
por_canal = (
    ventas.groupby("canal", as_index=False)
    .agg(
        operaciones=("venta_id", "nunique"),
        unidades=("cantidad", "sum"),
        ingresos=("ingresos", "sum"),
        costo_referencial=("costo_referencial_total", "sum"),
        utilidad_referencial=("utilidad_referencial", "sum")
    )
)

por_canal["margen_referencial_pct"] = (
    por_canal["utilidad_referencial"]
    / por_canal["ingresos"] * 100
).round(2)

# Rentabilidad por producto
por_producto = (
    ventas.groupby(
        ["producto_id", "producto", "categoria"],
        as_index=False
    )
    .agg(
        unidades=("cantidad", "sum"),
        ingresos=("ingresos", "sum"),
        utilidad_referencial=("utilidad_referencial", "sum")
    )
    .sort_values("utilidad_referencial", ascending=False)
)

# Rentabilidad por cliente
por_cliente = (
    ventas.groupby(
        ["cliente_id", "cliente"],
        as_index=False
    )
    .agg(
        operaciones=("venta_id", "nunique"),
        ingresos=("ingresos", "sum"),
        utilidad_referencial=("utilidad_referencial", "sum")
    )
    .sort_values("utilidad_referencial", ascending=False)
)

# Exportar archivos
por_canal.to_csv(salida / "kpi_canales.csv", index=False)
por_producto.to_csv(salida / "kpi_productos.csv", index=False)
por_cliente.to_csv(salida / "kpi_clientes.csv", index=False)

print("\nINDICADORES POR CANAL")
print(por_canal.to_string(index=False))

print("\nARCHIVOS GENERADOS CORRECTAMENTE")
print("kpi_canales.csv")
print("kpi_productos.csv")
print("kpi_clientes.csv")

