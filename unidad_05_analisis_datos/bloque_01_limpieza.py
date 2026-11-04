import pandas as pd

cartera = [
    {"id_credito": 1001, "empresa": "Alfa", "monto": 180000, "dias_atraso": 0},
    {"id_credito": 1002, "empresa": "Beta", "monto": 250000, "dias_atraso": 15},
    {"id_credito": 1003, "empresa": "Gamma", "monto": None, "dias_atraso": 45},
    {"id_credito": 1004, "empresa": "Delta", "monto": 450000, "dias_atraso": 30},
    {"id_credito": 1004, "empresa": "Delta", "monto": 450000, "dias_atraso": 30},
    {"id_credito": 1005, "empresa": "Epsilon", "monto": 200000, "dias_atraso": -5}
]

df = pd.DataFrame(cartera)

print(df)

print("\nDetección de duplicados:")
print(df.duplicated())

duplicados = df[df.duplicated()]

print("\nRegistros duplicados:")
print(duplicados)

total_duplicados = df.duplicated().sum()
print("Total de registros duplicados:", total_duplicados)

print("\nValores faltantes por columna:")
print(df.isnull().sum())

atrasos_negativos = df[df["dias_atraso"] < 0]
print(atrasos_negativos)

df_limpio = df.drop_duplicates()

print("\nCartera sin duplicados:")
print(df_limpio)

print("\nControl de registros:")
print("Registros originales:", len(df))
print("Registros después de eliminar duplicados:", len(df_limpio))
print("Registros excluidos:", len(df) - len(df_limpio))

montos_faltantes = df_limpio[df_limpio["monto"].isnull()]

print("\nCréditos con monto faltante:")
print(montos_faltantes)

cartera_atrasada = df_limpio[
    (df_limpio["dias_atraso"] > 15) &
    (df_limpio["monto"] > 0)
]

print(cartera_atrasada)

df_limpio.to_csv(
    "unidad_05_analisis_datos/cartera_depurada.csv",
    index=False
)

cartera_importada = pd.read_csv(
    "unidad_05_analisis_datos/cartera_depurada.csv"
)

print("\nCartera importada desde CSV:")
print(cartera_importada)

cartera_importada = pd.read_csv(
    "unidad_05_analisis_datos/cartera_depurada.csv"
)

print("\nCartera importada desde CSV:")
print(cartera_importada)

