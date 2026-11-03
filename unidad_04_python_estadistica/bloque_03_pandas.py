import pandas as pd

print("Pandas instalado correctamente")

cartera = [
    {"empresa": "Alfa", "monto": 180000, "dias_atraso": 0},
    {"empresa": "Beta", "monto": 250000, "dias_atraso": 15},
    {"empresa": "Gamma", "monto": 320000, "dias_atraso": 45},
    {"empresa": "Delta", "monto": 450000, "dias_atraso": 30},
    {"empresa": "Epsilon", "monto": 200000, "dias_atraso": 20}
]

df = pd.DataFrame(cartera)

print(df)

cartera_atrasada = df[df["dias_atraso"] > 0]

print("Créditos con atraso:")
print(cartera_atrasada)

creditos_grandes = df[df["monto"] > 300000]

print("Créditos mayores a $300,000:")
print(creditos_grandes)

def clasificar_riesgo(dias_atraso):
    if dias_atraso > 30:
        return "Atraso alto"
    elif dias_atraso >= 1:
        return "Atraso leve"
    else:
        return "Vigente"

df["riesgo"] = df["dias_atraso"].apply(clasificar_riesgo)

print(df)

resumen_riesgo = df.groupby("riesgo")["monto"].sum()

print("Resumen de cartera por riesgo:")
print(resumen_riesgo)

cartera_total = df["monto"].sum()

porcentaje_riesgo = (resumen_riesgo / cartera_total) * 100

reporte = pd.DataFrame({
    "Monto": resumen_riesgo,
    "Participacion_%": porcentaje_riesgo
})

# Mostrar reporte financiero
print("REPORTE DE CARTERA POR NIVEL DE RIESGO")
print(reporte.round(2))


# Ordenar el reporte de mayor a menor exposición
reporte_ordenado = reporte.sort_values(
    "Participacion_%",
    ascending=False
)

print("REPORTE ORDENADO POR PARTICIPACION")
print(reporte_ordenado.round(2))


# Exportar reporte a CSV
reporte_ordenado.round(2).to_csv(
    "unidad_04_python_estadistica/reporte_cartera.csv",
    index=True
)

print("Reporte CSV generado correctamente")