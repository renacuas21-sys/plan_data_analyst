def calcular_interes(monto, tasa):
    interes = monto * tasa
    return interes

    # Unidad 4 - Bloque 2
# Integrador: análisis de cartera con funciones

def monto_en_atraso(monto, dias_atraso):
    if dias_atraso > 0:
        return monto
    else:
        return 0


cartera = [
    {"empresa": "Alfa", "monto": 180000, "dias_atraso": 0},
    {"empresa": "Beta", "monto": 250000, "dias_atraso": 15},
    {"empresa": "Gamma", "monto": 320000, "dias_atraso": 45},
    {"empresa": "Delta", "monto": 450000, "dias_atraso": 30},
    {"empresa": "Epsilon", "monto": 200000, "dias_atraso":20} 
]

total_atrasado = 0

for credito in cartera:
    exposicion = monto_en_atraso(
        credito["monto"],
        credito["dias_atraso"]
    )

    total_atrasado = total_atrasado + exposicion

print("Cartera con atraso:", total_atrasado)

cartera_total = 0

for credito in cartera:
    cartera_total = cartera_total + credito["monto"]

print("Cartera total:", cartera_total)

def calcular_porcentaje(monto_atrasado, monto_total):
    porcentaje = (monto_atrasado / monto_total) * 100
    return porcentaje

porcentaje_atraso = calcular_porcentaje(total_atrasado, cartera_total)

print("Porcentaje de cartera con atraso:", round(porcentaje_atraso, 2), "%")

def clasificar_riesgo(dias_atraso):
    if dias_atraso > 30:
        return "Atraso alto"
    elif dias_atraso >= 1:
        return "Atraso leve"
    else:
        return "Vigente"

        print("Crédito Alfa:", clasificar_riesgo(0))
print("Crédito Beta:", clasificar_riesgo(15))
print("Crédito Gamma:", clasificar_riesgo(45))

