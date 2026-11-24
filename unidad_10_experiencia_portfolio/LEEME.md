# Grupo NOVA | Unidad 10 — FP&A
Caso académico simulado. Moneda MXN. Periodo enero 2024 a diciembre 2025. No representa una empresa real.

## Encargo del CFO
Investigar crecimiento de ingresos y deterioro potencial de rentabilidad, localizar desviaciones frente a presupuesto y proponer automatización. La consolidación manual de 16 horas mensuales es un supuesto del caso. Los porcentajes iniciales de +12% y -8% son hipótesis del encargo, no resultados garantizados: calcular y comunicar los valores reales del dataset.

## Archivos y diccionario
- unidades.csv: unidad_id (PK), unidad (nombre).
- centros.csv: centro_id (PK), centro (nombre).
- cuentas.csv: cuenta_id (PK), cuenta (nombre), tipo (Ingreso, Costo, Gasto).
- movimientos.csv: movimiento_id (PK texto), mes (fecha, primer día del mes), unidad_id, centro_id, cuenta_id (FK texto), componente (entero 1 o 2), escenario (Real o Presupuesto), importe_mxn (entero positivo). Cada fila es un componente mensual simulado, no una factura. Real y Presupuesto son escenarios separados; no sumarlos juntos. Los centros son dimensiones sintéticas de asignación, no necesariamente responsables directos de cada ingreso.
- 57,600 movimientos, 5 unidades, 12 centros, 10 cuentas, 24 meses, 2 escenarios. Grano único: mes + unidad + centro + cuenta + componente + escenario.

## Jornada (8 horas efectivas)
1. 1 h: definir requerimientos, KPIs, hipótesis y criterios de aceptación.
2. 2 h: crear tablas PostgreSQL, importar catálogos primero, movimientos después; verificar filas, unicidad, FK y totales; construir vista y consultas de resultados por año, unidad y centro.
3. 1.5 h: Python/pandas: automatizar lectura, validación y exportación de KPIs; forecast 2026 con supuesto explícito (p. ej. crecimiento o promedio móvil), separar proyección de reales. Cronometrar ejecución.
4. 1 h: Excel: reporte Real vs Budget, desviaciones, tabla dinámica y gráfico.
5. 1.5 h: Power BI: medidas DAX, tarjetas y gráficos por unidad y mes; máximo dos páginas, no saturar. Verificar resultados contra SQL.
6. 1 h: README, capturas, recomendaciones, commit y push. No publicar credenciales ni archivos temporales.

## Definiciones y criterios
Ingresos = suma tipo Ingreso; costos y gastos = sumas positivas por tipo; EBITDA simplificado = ingresos - costos - gastos (sin depreciación, amortización, intereses ni impuestos en este dataset); margen = EBITDA / ingresos. Variación = Real - Presupuesto; para costos/gastos, positivo implica desfavorable; para ingresos/EBITDA, positivo implica favorable. Variación porcentual = diferencia / presupuesto, controlar cero. Crecimiento interanual = (actual/anterior)-1. No sumar porcentajes ni promediar márgenes sin ponderación. Forecast: declarar método, supuestos y limitaciones. Ahorro de tiempo = 16 h supuestas menos tiempo medido de proceso equivalente, incluyendo revisión; no atribuir ahorro monetario sin costo/hora y no afirmar impacto real.

## Entregables mínimos
SQL reproducible, script Python, CSV de KPIs, Excel, PBIX, README con hallazgos y recomendaciones. Criterios: reconciliación entre herramientas, separación de escenarios, explicación de desviaciones, forecast trazable, presentación clara y capacidad de defender decisiones. No se incluye solución para preservar la práctica autónoma.
