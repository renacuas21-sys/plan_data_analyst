# Unidad 4 - Bloque 1
# Análisis de cartera empresarial

cartera = [
    {"empresa": "Alfa", "monto": 250000, "dias_atraso": 0},
    {"empresa": "Beta", "monto": 180000, "dias_atraso": 15},
    {"empresa": "Gamma", "monto": 320000, "dias_atraso": 45},
    {"empresa": "Delta", "monto": 150000, "dias_atraso": 0}
]

# Inicializamos los indicadores
cartera_total = 0
creditos_atrasados = 0
monto_con_atraso = 0

# Recorremos los créditos
for credito in cartera:
    cartera_total = cartera_total + credito["monto"]

    if credito["dias_atraso"] > 0:
        creditos_atrasados = creditos_atrasados + 1
        monto_con_atraso = monto_con_atraso + credito["monto"]

# Mostramos los resultados
print("Cartera total:", cartera_total)
print("Créditos atrasados:", creditos_atrasados)
print("Monto con atraso:", monto_con_atraso)

porcentaje_atraso = (monto_con_atraso / cartera_total) * 100

print("Porcentaje de cartera con atraso:", round(porcentaje_atraso, 2), "%")