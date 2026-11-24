import pandas as pd
from pathlib import Path

# Definir rutas del proyecto
BASE_DIR = Path(__file__).resolve().parents[1]

DATA_DIR = BASE_DIR / "data" / "processed"

# Cargar información financiera
df = pd.read_csv(DATA_DIR / "finanzas_consolidado.csv")

# Diagnóstico inicial
print("\nDIMENSIONES DEL DATASET")
print(df.shape)

print("\nCOLUMNAS")
print(df.columns.tolist())

print("\nPRIMEROS REGISTROS")
print(df.head())

print("\nTIPOS DE DATOS")
print(df.dtypes)

print("\nVALORES NULOS")
print(df.isnull().sum())

# Estado de resultados consolidado

df["mes"] = pd.to_datetime(df["mes"])
df["anio"] = df["mes"].dt.year

pnl = df.pivot_table(
    index=["anio", "escenario"],
    columns="tipo",
    values="importe_mxn",
    aggfunc="sum",
    fill_value=0
).reset_index()

pnl = pnl.rename(columns={
    "Ingreso": "ingresos",
    "Costo": "costos",
    "Gasto": "gastos"
})

pnl["utilidad_bruta"] = (
    pnl["ingresos"] - pnl["costos"]
)

pnl["ebitda"] = (
    pnl["utilidad_bruta"] - pnl["gastos"]
)

pnl["margen_ebitda"] = (
    pnl["ebitda"] / pnl["ingresos"] * 100
).round(2)

print("\nESTADO DE RESULTADOS CONSOLIDADO")
print(pnl.to_string(index=False))

# Comparativo anual YoY

indicadores = [
    "ingresos",
    "costos",
    "utilidad_bruta",
    "gastos",
    "ebitda"
]

yoy = pnl[pnl["escenario"] == "Real"].set_index("anio")

comparativo_yoy = pd.DataFrame({
    "2024": yoy.loc[2024, indicadores],
    "2025": yoy.loc[2025, indicadores]
})

comparativo_yoy = comparativo_yoy.apply(pd.to_numeric)

comparativo_yoy["variacion_mxn"] = (
    comparativo_yoy["2025"] - comparativo_yoy["2024"]
)

comparativo_yoy["variacion_pct"] = (
    comparativo_yoy["variacion_mxn"]
    / comparativo_yoy["2024"] * 100
).round(2)

print("\nCOMPARATIVO ANUAL YoY")
print(comparativo_yoy)

# Desviaciones presupuestales 2025

budget = pnl[pnl["anio"] == 2025].set_index("escenario")

comparativo_budget = pd.DataFrame({
    "real": budget.loc["Real", indicadores],
    "presupuesto": budget.loc["Presupuesto", indicadores]
})

comparativo_budget = comparativo_budget.apply(pd.to_numeric)

comparativo_budget["desviacion_mxn"] = (
    comparativo_budget["real"]
    - comparativo_budget["presupuesto"]
)

comparativo_budget["desviacion_pct"] = (
    comparativo_budget["desviacion_mxn"]
    / comparativo_budget["presupuesto"] * 100
).round(2)

# Clasificar impacto financiero

comparativo_budget["impacto"] = "Favorable"

for indicador in comparativo_budget.index:

    desviacion = comparativo_budget.loc[
        indicador, "desviacion_mxn"
    ]

    if desviacion == 0:
        impacto = "Sin desviacion"

    elif indicador in ["costos", "gastos"]:
        impacto = "Desfavorable" if desviacion > 0 else "Favorable"

    else:
        impacto = "Favorable" if desviacion > 0 else "Desfavorable"

    comparativo_budget.loc[indicador, "impacto"] = impacto

print("\nREAL VS PRESUPUESTO 2025")
print(comparativo_budget.to_string())

# Rentabilidad por unidad de negocio

unidades = df[
    (df["anio"] == 2025) &
    (df["escenario"] == "Real")
].pivot_table(
    index="unidad",
    columns="tipo",
    values="importe_mxn",
    aggfunc="sum",
    fill_value=0
).reset_index()

unidades = unidades.rename(columns={
    "Ingreso": "ingresos",
    "Costo": "costos",
    "Gasto": "gastos"
})

unidades["utilidad_bruta"] = (
    unidades["ingresos"] - unidades["costos"]
)

unidades["ebitda"] = (
    unidades["utilidad_bruta"] - unidades["gastos"]
)

unidades["margen_ebitda"] = (
    unidades["ebitda"]
    / unidades["ingresos"].replace(0, float("nan")) * 100
).round(2)

unidades["clasificacion"] = unidades["ebitda"].apply(
    lambda x: "Rentable" if x > 0
    else "En perdida" if x < 0
    else "Punto de equilibrio"
)

unidades = unidades.sort_values(
    "ebitda", ascending=False
)

print("\nRENTABILIDAD POR UNIDAD DE NEGOCIO 2025")
print(unidades.to_string(index=False))

# Identificacion de desviaciones criticas

alertas = df[df["anio"] == 2025].pivot_table(
    index=["unidad", "tipo", "cuenta"],
    columns="escenario",
    values="importe_mxn",
    aggfunc="sum",
    fill_value=0
).reset_index()

alertas["desviacion_mxn"] = (
    alertas["Real"] - alertas["Presupuesto"]
)

alertas["desviacion_pct"] = (
    alertas["desviacion_mxn"]
    / alertas["Presupuesto"].replace(0, float("nan"))
    * 100
).round(2)

alertas["impacto_ebitda"] = alertas.apply(
    lambda fila: fila["desviacion_mxn"]
    if fila["tipo"] == "Ingreso"
    else -fila["desviacion_mxn"],
    axis=1
)

def clasificar_alerta(fila):

    if pd.isna(fila["desviacion_pct"]):
        return "Sin presupuesto"

    if fila["impacto_ebitda"] >= 0:
        return "Sin alerta"

    desviacion = abs(fila["desviacion_pct"])

    if desviacion >= 25:
        return "Critica"
    elif desviacion >= 15:
        return "Alta"
    elif desviacion >= 5:
        return "Moderada"
    else:
        return "Normal"

alertas["nivel_alerta"] = alertas.apply(
    clasificar_alerta, axis=1
)

alertas = alertas.sort_values("impacto_ebitda")

print("\nTOP 15 DESVIACIONES FINANCIERAS")
print(alertas.head(15).to_string(index=False))

print("\nRESUMEN DE ALERTAS")
print(alertas["nivel_alerta"].value_counts())

# Forecast financiero 2026

base_2025 = pnl[
    (pnl["anio"] == 2025) &
    (pnl["escenario"] == "Real")
].iloc[0]

escenarios = {
    "Pesimista": {
        "ingresos": 0.03,
        "costos": 0.08,
        "gastos": 0.06
    },
    "Base": {
        "ingresos": 0.08,
        "costos": 0.02,
        "gastos": 0.00
    },
    "Optimista": {
        "ingresos": 0.12,
        "costos": -0.03,
        "gastos": -0.05
    }
}

proyecciones = []

for escenario, tasas in escenarios.items():

    ingresos = base_2025["ingresos"] * (
        1 + tasas["ingresos"]
    )

    costos = base_2025["costos"] * (
        1 + tasas["costos"]
    )

    gastos = base_2025["gastos"] * (
        1 + tasas["gastos"]
    )

    utilidad_bruta = ingresos - costos
    ebitda = utilidad_bruta - gastos
    margen = ebitda / ingresos * 100

    proyecciones.append({
        "anio": 2026,
        "escenario": escenario,
        "ingresos": ingresos,
        "costos": costos,
        "gastos": gastos,
        "utilidad_bruta": utilidad_bruta,
        "ebitda": ebitda,
        "margen_ebitda": margen
    })

forecast = pd.DataFrame(proyecciones).round(2)

print("\nFORECAST FINANCIERO 2026")
print(forecast.to_string(index=False))

# Exportacion automatica a Excel

from pathlib import Path

ruta_excel = (
    Path(__file__).resolve().parent.parent
    / "excel"
    / "Reporte_Financiero_Grupo_Nova.xlsx"
)

ruta_excel.parent.mkdir(parents=True, exist_ok=True)

with pd.ExcelWriter(
    ruta_excel,
    engine="openpyxl"
) as writer:

    pnl.to_excel(
        writer,
        sheet_name="Estado de Resultados",
        index=False
    )

    comparativo_yoy.to_excel(
        writer,
        sheet_name="Comparativo YoY"
    )

    comparativo_budget.to_excel(
        writer,
        sheet_name="Real vs Presupuesto"
    )

    unidades.to_excel(
        writer,
        sheet_name="Unidades de Negocio",
        index=False
    )

    alertas.to_excel(
        writer,
        sheet_name="Alertas Financieras",
        index=False
    )

    forecast.to_excel(
        writer,
        sheet_name="Forecast 2026",
        index=False
    )

    df.to_excel(
        writer,
        sheet_name="Base de Datos",
        index=False
    )

print("\nREPORTE FINANCIERO GENERADO")
print(ruta_excel)


