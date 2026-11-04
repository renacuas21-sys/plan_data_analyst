import pandas as pd

clientes = [
    {"id_credito": 1001, "sector": "Comercio", "region": "Norte"},
    {"id_credito": 1002, "sector": "Industria", "region": "Centro"},
    {"id_credito": 1003, "sector": "Servicios", "region": "Sur"},
    {"id_credito": 1004, "sector": "Comercio", "region": "Norte"},
    {"id_credito": 1005, "sector": "Industria", "region": "Centro"}
]

df_clientes = pd.DataFrame(clientes)

print("\nTabla de clientes:")
print(df_clientes)

df_cartera = pd.read_csv(
    "unidad_05_analisis_datos/cartera_depurada.csv"
)

df_combinado = pd.merge(
    df_cartera,
    df_clientes,
    on="id_credito",
    how="inner",
    validate="one_to_one"
)

print("\nCartera combinada:")
print(df_combinado)

df_clientes_incompleto = df_clientes[
    df_clientes["id_credito"] != 1003
]

df_left = pd.merge(
    df_cartera,
    df_clientes_incompleto,
    on="id_credito",
    how="left",
    validate="one_to_one"
)

print("\nResultado LEFT JOIN:")
print(df_left)

creditos_sin_sector = df_left[
    df_left["sector"].isnull()
]

print("\nCréditos sin información de sector:")
print(creditos_sin_sector)

print("\nCantidad de créditos sin sector:")
print(len(creditos_sin_sector))

cartera_por_sector = df_combinado.groupby("sector")["monto"].sum()

print("\nCartera total por sector:")
print(cartera_por_sector)

total_cartera = df_combinado["monto"].sum()

porcentaje_sector = (
    cartera_por_sector / total_cartera
) * 100

print("\nCartera total conocida:")
print(total_cartera)

print("\nConcentración porcentual por sector:")
print(porcentaje_sector.round(2))

atraso_por_sector = df_combinado.groupby("sector")["dias_atraso"].mean()

print("\nPromedio de días de atraso por sector:")
print(atraso_por_sector.round(2))

resumen_sector = df_combinado.groupby("sector").agg(
    total_creditos=("id_credito", "count"),
    cartera_total=("monto", "sum"),
    atraso_promedio=("dias_atraso", "mean"),
    monto_promedio=("monto", "mean")
)

print("\nResumen financiero por sector:")
print(resumen_sector.round(2))

montos_faltantes = df_combinado[
    df_combinado["monto"].isnull()
]

atrasos_negativos = df_combinado[
    df_combinado["dias_atraso"] < 0
]

print("\nCréditos con monto faltante:")
print(montos_faltantes)

print("\nCréditos con días de atraso negativos:")
print(atrasos_negativos)

creditos_morosos = df_combinado[
    df_combinado["dias_atraso"] > 15
]

print(creditos_morosos)

print(len(creditos_morosos))