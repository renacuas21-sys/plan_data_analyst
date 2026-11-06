
import pandas as pd

# Cargar la cartera depurada del Bloque 1
ruta = "unidad_05_analisis_datos/cartera_depurada.csv"

df_cartera = pd.read_csv(ruta)

# Revisar los primeros registros
print(df_cartera.head())

print("\nEstructura de la cartera:")
df_cartera.info()

print("\nValores faltantes por columna:")
print(df_cartera.isnull().sum())

# Identificar créditos con monto faltante
creditos_sin_monto = df_cartera[df_cartera["monto"].isnull()]

print("\nCréditos con monto faltante:")
print(creditos_sin_monto)


# Indicadores de calidad y exposición financiera
saldo_conocido = df_cartera["monto"].sum()
creditos_pendientes = df_cartera["monto"].isnull().sum()

print("\nSaldo conocido de la cartera:", saldo_conocido)
print("Créditos con monto pendiente:", creditos_pendientes)



# Créditos con más de 15 días de atraso
creditos_morosos = df_cartera[df_cartera["dias_atraso"] > 15]

print("\nCréditos con más de 15 días de atraso:")
print(creditos_morosos)


# Porcentaje de créditos con más de 15 días de atraso
total_creditos = len(df_cartera)
numero_morosos = len(creditos_morosos)

porcentaje_morosos = (numero_morosos / total_creditos) * 100

print("\nTotal de créditos:", total_creditos)
print("Créditos morosos:", numero_morosos)
print("Porcentaje de créditos morosos:", porcentaje_morosos, "%")


# Exposición financiera morosa conocida
saldo_moroso_conocido = creditos_morosos["monto"].sum()

# Porcentaje sobre el saldo conocido
porcentaje_saldo_moroso = (
    saldo_moroso_conocido / saldo_conocido
) * 100

print("\nSaldo moroso conocido:", saldo_moroso_conocido)
print("Porcentaje sobre saldo conocido:", porcentaje_saldo_moroso, "%")


# Validar si la morosidad por saldo es definitiva
if creditos_pendientes > 0:
    print("\nADVERTENCIA: Existen créditos sin monto.")
    print("La morosidad por saldo es parcial.")
else:
    print("\nLa morosidad por saldo está completa.")



# Información complementaria de clientes
df_clientes = pd.DataFrame({
    "id_credito": [1001, 1002, 1003, 1004, 1005],
    "sector": ["Comercio", "Industria", "Servicios", "Comercio", "Industria"],
    "region": ["Norte", "Centro", "Sur", "Norte", "Centro"]
})

print("\nInformación de clientes:")
print(df_clientes)


# Combinar cartera con información de clientes
df_combinado = pd.merge(
    df_cartera,
    df_clientes,
    on="id_credito",
    how="inner",
    validate="one_to_one"
)

print("\nCartera combinada:")
print(df_combinado)


# Saldo conocido por sector económico
saldo_por_sector = df_combinado.groupby("sector")["monto"].sum()

print("\nSaldo conocido por sector:")
print(saldo_por_sector)


# Contar montos faltantes por sector
faltantes_por_sector = df_combinado.groupby("sector")["monto"].apply(
    lambda columna: columna.isnull().sum()
)

print("\nMontos faltantes por sector:")
print(faltantes_por_sector)


# Reporte consolidado por sector
reporte_sector = df_combinado.groupby("sector").agg(
    numero_creditos=("id_credito", "count"),
    saldo_conocido=("monto", "sum"),
    montos_faltantes=("monto", lambda x: x.isnull().sum())
)

print("\nREPORTE CONSOLIDADO POR SECTOR:")
print(reporte_sector)


# Validar integridad de registros
creditos_originales = len(df_cartera)
creditos_combinados = len(df_combinado)

print("\nVALIDACIÓN DE INTEGRIDAD:")
print("Créditos originales:", creditos_originales)
print("Créditos combinados:", creditos_combinados)

if creditos_originales == creditos_combinados:
    print("VALIDACIÓN CORRECTA: No se perdieron créditos.")
else:
    print("ADVERTENCIA: Existen diferencias entre las tablas.")



# Validar integridad de registros
creditos_originales = len(df_cartera)
creditos_combinados = len(df_combinado)

print("\nVALIDACIÓN DE INTEGRIDAD:")
print("Créditos originales:", creditos_originales)
print("Créditos combinados:", creditos_combinados)

if creditos_originales == creditos_combinados:
    print("VALIDACIÓN CORRECTA: No se perdieron créditos.")
else:
    print("ADVERTENCIA: Existen diferencias entre las tablas.")


# Identificar créditos sin información de clientes
revision = df_cartera.merge(
    df_clientes,
    on="id_credito",
    how="left",
    indicator=True
)

creditos_sin_coincidencia = revision[
    revision["_merge"] == "left_only"
]

print("\nCRÉDITOS SIN COINCIDENCIA:")
print(creditos_sin_coincidencia)

