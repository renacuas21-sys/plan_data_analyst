import pandas as pd

cartera = [
    {"empresa": "Alfa", "monto": 180000, "dias_atraso": 0},
    {"empresa": "Beta", "monto": 250000, "dias_atraso": 15},
    {"empresa": "Gamma", "monto": 320000, "dias_atraso": 45},
    {"empresa": "Delta", "monto": 450000, "dias_atraso": 30},
    {"empresa": "Epsilon", "monto": 200000, "dias_atraso": 20}
]

df = pd.DataFrame(cartera)

print("CARTERA ORIGINAL")
print(df)

# Indicadores generales de cartera

total_cartera = df["monto"].sum()
print(total_cartera)
promedio_credito = df["monto"].mean()
print(promedio_credito)
promedio_atraso = df["dias_atraso"].mean()
print(promedio_atraso)

# Indicadores estadísticos de cartera

mediana_atraso = df["dias_atraso"].median()
print(mediana_atraso)
desviacion_atraso = df["dias_atraso"].std()
print(round(desviacion_atraso, 2))

# Analisis de riesgo crediticio

cartera_alto_atraso = df[df["dias_atraso"] > 15]
print(cartera_alto_atraso)
total_alto_atraso = cartera_alto_atraso["monto"].sum()
print(total_alto_atraso)

porcentaje_alto_atraso = (total_alto_atraso / total_cartera) * 100
print(round(porcentaje_alto_atraso,2))

print("\nREPORTE EJECUTIVO DE CARTERA")
print("----------------------------")

print("Cartera total: $", total_cartera)
print("Crédito promedio: $", promedio_credito)
print("Atraso promedio:", promedio_atraso, "días")
print("Mediana de atraso:", mediana_atraso, "días")
print("Desviación estándar:", round(desviacion_atraso, 2), "días")

print("\nCARTERA CON MÁS DE 15 DÍAS DE ATRASO")
print(cartera_alto_atraso)

print("Exposición total: $", total_alto_atraso)
print("Participación:", round(porcentaje_alto_atraso, 2), "%")