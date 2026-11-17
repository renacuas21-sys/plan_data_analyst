
# Unidad 8 — Finanzas Aplicadas

## Información general

- **Programa:** Plan de Formación Data Analyst
- **Unidad:** 8 de 12
- **Tema:** Finanzas Aplicadas y Análisis Financiero Corporativo
- **Fecha de inicio:** 12 de noviembre de 2026
- **Estado:** En desarrollo
- **Herramientas:** Microsoft Excel, Visual Studio Code y Git/GitHub
- **Mentor:** Francisco Delgadillo
- **Enfoque profesional:** Financial Analyst, FP&A y Business Analytics

---

## Objetivo de la unidad

Desarrollar competencias para interpretar información financiera, evaluar la rentabilidad y liquidez de una empresa, analizar presupuestos, construir proyecciones y formular recomendaciones ejecutivas sustentadas en datos.

La unidad integra conocimientos financieros con herramientas de análisis para fortalecer la toma de decisiones empresariales.

---

## Estructura de la unidad

1. **Bloque 1:** Análisis de estados financieros, rentabilidad, liquidez y endeudamiento.
2. **Bloque 2:** Presupuestos y análisis de variaciones.
3. **Bloque 3:** Forecasting y análisis de escenarios.
4. **Bloque 4:** Evaluación financiera y recomendaciones ejecutivas.

---

## Bloque 1 — Análisis de Estados Financieros

**Fecha:** 12 de noviembre de 2026

**Estado:** Prácticas realizadas; evaluación formativa 8.0/10, pendiente de revisión por el mentor.

### Objetivo

Interpretar indicadores de rentabilidad, liquidez, capital de trabajo, flujo de efectivo y endeudamiento, identificando riesgos financieros y proponiendo medidas correctivas.



### Caso práctico 1 — Análisis de rentabilidad

#### Situación inicial

Se analizó una empresa que incrementó sus ingresos entre 2025 y 2026, pero no consiguió aumentar su utilidad operativa.

| Concepto | 2025 | 2026 | Variación |
|---|---:|---:|---:|
| Ingresos | $80 M | $100 M | +25.00% |
| Costo de ventas | $48 M | $65 M | +35.42% |
| Gastos operativos | $20 M | $23 M | +15.00% |
| Utilidad operativa | $12 M | $12 M | 0.00% |
| Margen operativo | 15.00% | 12.00% | -3 pp |

#### Diagnóstico

La empresa consiguió incrementar sus ingresos un 25%, pero el costo de ventas creció un 35.42%.

El crecimiento comercial no se tradujo en una mayor utilidad operativa, debido al incremento de costos y gastos.

**Conclusión:** vender más no garantiza una mayor rentabilidad. Es necesario evaluar la eficiencia de los costos y el margen generado por las operaciones.

---

### Caso práctico 2 — Impacto de descuentos y costos

Se evaluó un producto representativo bajo diferentes escenarios comerciales.

| Indicador | 2025 | 2026 |
|---|---:|---:|
| Unidades vendidas | 10,000 | 11,500 |
| Precio de lista | $1,000 | $1,000 |
| Descuento comercial | 0% | 5% |
| Costo unitario | $600 | $648 |
| Ingresos netos | $10,000,000 | $10,925,000 |
| Costo total | $6,000,000 | $7,452,000 |
| Utilidad bruta | $4,000,000 | $3,473,000 |
| Margen bruto | 40.00% | 31.79% |

#### Análisis de variaciones

La utilidad bruta disminuyó $527,000, equivalente al 13.18%, a pesar de que el volumen aumentó un 15%.

La descomposición secuencial de la variación fue:

- Efecto volumen: +$600,000.
- Efecto descuentos: -$575,000.
- Efecto incremento de costo unitario: -$552,000.
- **Variación total: -$527,000.**

#### Evaluación de escenarios

Se analizaron dos alternativas:

**Escenario A: eliminar descuentos sin perder volumen**

- Unidades vendidas: 11,500.
- Utilidad bruta: $4,048,000.
- Incremento respecto a la situación actual: $575,000.

**Escenario B: eliminar descuentos con reducción del 10% en volumen**

- Unidades vendidas: 10,350.
- Utilidad bruta: $3,643,200.
- Incremento respecto a la situación actual: $170,200.
- Mejora de utilidad: 4.90%.

También se determinó que se requieren al menos 9,867 unidades sin descuento para conservar la utilidad bruta actual.

#### Recomendación ejecutiva

La eliminación del descuento comercial podría mejorar la rentabilidad incluso con una disminución moderada del volumen.

Se recomienda realizar una prueba comercial controlada y evaluar la respuesta de los clientes antes de implementar la medida de manera general.

El análisis demuestra la importancia de evaluar conjuntamente precio, volumen, costos y utilidad, en lugar de utilizar únicamente el crecimiento de ventas como indicador de desempeño.

---



### Caso práctico 3 — Balance General y liquidez

#### Situación inicial

Se analizó el Balance General simplificado de una empresa para evaluar su capacidad de cumplir obligaciones financieras.

Todos los importes están expresados en millones de pesos mexicanos (MXN).

| Concepto | Importe |
|---|---:|
| Efectivo | $5 |
| Cuentas por cobrar | $15 |
| Inventarios | $20 |
| **Activo circulante** | **$40** |
| Activo no circulante | $60 |
| **Activo total** | **$100** |
| Pasivo circulante | $32 |
| Pasivo a largo plazo | $28 |
| Capital contable | $40 |

#### Indicadores calculados

**Razón circulante**

Razón circulante = Activo circulante / Pasivo circulante

40 / 32 = **1.25 veces**

Por cada peso de obligaciones de corto plazo, la empresa dispone de $1.25 en activos circulantes.

**Capital de trabajo**

Capital de trabajo = Activo circulante - Pasivo circulante

40 - 32 = **$8 millones**

La empresa presenta un excedente contable positivo de activos circulantes sobre pasivos circulantes.

**Prueba ácida**

Prueba ácida = (Activo circulante - Inventarios) / Pasivo circulante

(40 - 20) / 32 = **0.625 veces**

Al excluir los inventarios, la cobertura de las obligaciones de corto plazo disminuye considerablemente.

**Cobertura inmediata de efectivo**

Efectivo / Pasivo circulante

5 / 32 = **15.63%**

El efectivo disponible cubre solamente el 15.63% de las obligaciones circulantes.

#### Diagnóstico financiero

Aunque la empresa presenta una razón circulante superior a 1 y capital de trabajo positivo, existe una dependencia importante de activos que todavía deben convertirse en efectivo.

La composición del activo circulante es:

- Efectivo: 12.50%.
- Cuentas por cobrar: 37.50%.
- Inventarios: 50.00%.

En conjunto, el 87.50% del activo circulante está concentrado en cuentas por cobrar e inventarios.

Esto representa un riesgo potencial si la recuperación de cartera y la rotación de inventarios no coinciden con los vencimientos de las obligaciones.

#### Recomendaciones

1. Revisar la antigüedad y recuperación de cuentas por cobrar.
2. Analizar la rotación de inventarios y detectar mercancía de lento movimiento.
3. Construir un calendario de vencimientos de obligaciones.
4. Comparar los flujos esperados de cobranza con los compromisos de pago.
5. Mantener una reserva mínima de efectivo para necesidades operativas.

**Conclusión:** una posición positiva de capital de trabajo no garantiza liquidez inmediata. Es necesario evaluar la disponibilidad real de efectivo y el momento en que ocurren los cobros y pagos.

---

### Caso práctico 4 — Ciclo de conversión de efectivo

Se evaluaron los siguientes indicadores operativos:

| Indicador | Días |
|---|---:|
| Días de inventario (DIO) | 75 |
| Días de cuentas por cobrar (DSO) | 45 |
| Días de cuentas por pagar (DPO) | 30 |

#### Cálculo

CCC = DIO + DSO - DPO

75 + 45 - 30 = **90 días**

El ciclo de conversión de efectivo indica que la empresa debe financiar, en promedio, 90 días de operación entre el pago a proveedores y la recuperación del efectivo.

#### Escenario de reducción del crédito de proveedores

Si los proveedores reducen sus plazos de pago de 30 a 15 días:

CCC = 75 + 45 - 15 = **105 días**

El ciclo se incrementaría en 15 días, generando una mayor necesidad de financiamiento operativo.

#### Diagnóstico

La empresa debe coordinar los periodos de cobranza, rotación de inventarios y vencimientos de proveedores.

Un ciclo de conversión más largo puede generar presión sobre la tesorería, incluso cuando la empresa presenta utilidades contables.

**Conclusión:** mejorar la cobranza, optimizar inventarios y negociar condiciones de pago sostenibles puede reducir las necesidades de financiamiento del capital de trabajo.

---



### Caso práctico 5 — Proyección de liquidez a 30 días

#### Situación inicial

Se evaluó la disponibilidad de efectivo de una empresa para afrontar sus compromisos durante los próximos 30 días.

Importes expresados en millones de pesos mexicanos.

| Concepto | Importe |
|---|---:|
| Efectivo inicial | $5 |
| Cobranza esperada | +$8 |
| Efectivo disponible proyectado | $13 |
| Pagos a proveedores | -$10 |
| Nómina y gastos | -$6 |
| **Saldo final proyectado** | **-$3** |

#### Diagnóstico

La empresa presenta un déficit proyectado de $3 millones, debido a que sus compromisos de pago superan los recursos disponibles.

#### Recomendaciones

1. Revisar gastos no indispensables que puedan reprogramarse.
2. Negociar extensiones de plazo con proveedores sin comprometer la operación.
3. Acelerar la cobranza de cuentas por cobrar.
4. Elaborar un calendario semanal de entradas y salidas de efectivo.
5. Evaluar alternativas de financiamiento de corto plazo si las medidas operativas son insuficientes.

**Conclusión:** la planeación de tesorería permite anticipar necesidades de efectivo y tomar decisiones antes de que se materialice un incumplimiento.

---

### Caso práctico 6 — Flujo de efectivo operativo

#### Situación inicial

Se analizó una empresa con utilidad neta positiva, pero con diferencias entre su resultado contable y el efectivo generado.

| Concepto | Millones MXN |
|---|---:|
| Utilidad neta | $12 |
| Depreciación | +$3 |
| Incremento en cuentas por cobrar | -$5 |
| Incremento en inventarios | -$4 |
| Incremento en cuentas por pagar | +$2 |
| **Flujo operativo** | **$8** |

#### Interpretación

La empresa reportó una utilidad neta de $12 millones, pero generó únicamente $8 millones de flujo operativo.

La diferencia se explica por ajustes contables y movimientos del capital de trabajo.

- La depreciación se agrega porque no representa una salida de efectivo del periodo.
- El incremento en cuentas por cobrar reduce el flujo porque parte de los ingresos todavía no se ha cobrado.
- El incremento en inventarios representa recursos invertidos en mercancía.
- El incremento en cuentas por pagar favorece temporalmente el flujo porque existen obligaciones pendientes de pago.

#### Diagnóstico

La empresa presenta generación positiva de efectivo operativo, pero debe revisar su administración de capital de trabajo.

Es necesario analizar la evolución de la cobranza, inventarios y pagos para determinar si la diferencia entre utilidad y efectivo es temporal o recurrente.

**Conclusión:** la utilidad contable no equivale al efectivo disponible. La evaluación financiera debe considerar ambos indicadores.

---

### Caso práctico 7 — Endeudamiento y cobertura financiera

#### Estructura financiera

| Concepto | Millones MXN |
|---|---:|
| Activo total | $100 |
| Pasivo circulante | $32 |
| Pasivo a largo plazo | $28 |
| Pasivo total | $60 |
| Capital contable | $40 |

#### Indicadores

**Razón de endeudamiento**

60 / 100 × 100 = **60%**

El 60% de los activos está financiado mediante pasivos.

**Relación pasivo/capital**

60 / 40 = **1.50 veces**

Por cada peso de capital contable, la empresa presenta $1.50 en obligaciones.

#### Evaluación de capacidad de pago

En un escenario adicional se analizaron los siguientes datos:

| Indicador | Millones MXN |
|---|---:|
| Utilidad neta anual | $12 |
| Flujo operativo anual | $8 |
| Deuda financiera total | $35 |
| Servicio de deuda próximos 12 meses | $11 |
| Efectivo disponible | $5 |

Como aproximación inicial:

Cobertura = 8 / 11 = **0.73 veces**

Este resultado indica que el flujo operativo anual representa aproximadamente el 73% del servicio de deuda previsto.

No constituye un DSCR formal, ya que se requiere determinar el flujo efectivamente disponible para el servicio de deuda, considerar inversiones necesarias y evitar duplicar los intereses.

#### Diagnóstico

Aunque la empresa presenta utilidad neta positiva, no puede garantizarse su capacidad de pago únicamente con ese indicador.

El flujo operativo anual es inferior al servicio de deuda programado.

Si se considera el efectivo inicial de $5 millones y el flujo operativo de $8 millones, existirían $13 millones potencialmente disponibles frente a $11 millones de obligaciones.

Sin embargo, este escenario simplificado no contempla otras salidas de efectivo, inversiones, reservas mínimas ni el calendario de vencimientos.

#### Recomendaciones

1. Elaborar una proyección mensual de flujo de efectivo.
2. Identificar vencimientos de capital e intereses.
3. Determinar las inversiones indispensables para mantener la operación.
4. Establecer reservas mínimas de liquidez.
5. Evaluar la cobertura real del servicio de deuda.
6. Analizar alternativas de refinanciamiento cuando sea necesario.

**Conclusión:** la capacidad de pago debe evaluarse con base en la generación y disponibilidad de efectivo, no exclusivamente mediante la utilidad contable.

---



### Evaluación del Bloque 1

**Fecha:** 12 de noviembre de 2026  
**Calificación formativa:** 8.0/10  
**Estado:** Prácticas completadas; pendiente de revisión del mentor.

#### Competencias desarrolladas

1. Interpretación de ingresos, costos, utilidades y márgenes.
2. Análisis horizontal y evaluación de variaciones financieras.
3. Evaluación del impacto de precios, descuentos y costos.
4. Construcción de escenarios comerciales en Excel.
5. Interpretación de indicadores de liquidez y capital de trabajo.
6. Análisis del ciclo de conversión de efectivo.
7. Elaboración de proyecciones básicas de tesorería.
8. Interpretación del flujo operativo mediante el método indirecto.
9. Evaluación de endeudamiento y capacidad de pago.
10. Formulación de recomendaciones financieras ejecutivas.

#### Fortalezas identificadas

- Capacidad para relacionar crecimiento comercial con rentabilidad.
- Identificación de riesgos asociados con costos y descuentos.
- Interpretación de indicadores financieros desde una perspectiva empresarial.
- Experiencia en análisis de cartera, cobranza y obligaciones financieras.
- Capacidad para formular recomendaciones comerciales y operativas.
- Comprensión de la importancia de los flujos de efectivo.

#### Errores y oportunidades de mejora

**1. Precisión en los cálculos**

Durante los ejercicios se identificó inicialmente una confusión entre costos unitarios de diferentes periodos.

Se corrigió el cálculo y se reforzó la importancia de validar las referencias utilizadas en Excel.

**2. Definición de objetivos financieros**

En un ejercicio de escenarios se utilizó inicialmente la utilidad de 2025 como objetivo, cuando se solicitaba conservar la utilidad de 2026.

Se corrigió el resultado y se distinguieron ambos objetivos.

**3. Liquidez frente a rentabilidad**

Se reforzó la diferencia entre utilidad contable, activos circulantes y efectivo disponible.

**4. Endeudamiento y capacidad de pago**

Se identificó la necesidad de profundizar en indicadores de cobertura financiera, calendario de vencimientos y flujo disponible para servicio de deuda.

#### Aprendizaje principal

El análisis financiero requiere integrar rentabilidad, liquidez, capital de trabajo, endeudamiento y generación de efectivo.

Una empresa puede incrementar sus ventas y presentar utilidades contables positivas sin necesariamente mejorar su rentabilidad o disponer del efectivo suficiente para cumplir oportunamente sus obligaciones.

#### Pendientes de revisión con Francisco Delgadillo

- Validar los cálculos e interpretaciones de los casos prácticos.
- Revisar los escenarios financieros construidos en Excel.
- Evaluar el criterio utilizado para formular recomendaciones.
- Reforzar el cálculo e interpretación de cobertura del servicio de deuda.
- Determinar si se requieren ejercicios adicionales de estados financieros.

**Conclusión del Bloque 1:**

Se completaron las prácticas correspondientes al análisis de estados financieros, rentabilidad, liquidez, capital de trabajo, flujo operativo y endeudamiento.

El desempeño fue satisfactorio, con oportunidades de mejora en precisión financiera y evaluación de capacidad de pago.

El bloque queda documentado y pendiente de validación formal por el mentor.

---



## Bloque 2 — Presupuestos y Análisis de Variaciones

**Fecha:** 12–13 de noviembre de 2026  
**Estado:** Prácticas completadas; pendiente de revisión del mentor.  
**Evaluación formativa:** 8.0/10

### Objetivo

Desarrollar habilidades para comparar presupuestos con resultados reales, identificar desviaciones financieras, construir presupuestos flexibles, evaluar escenarios y proponer decisiones basadas en rentabilidad.

---

### Caso práctico 1 — Análisis presupuestario

Se evaluaron los resultados de una empresa con las siguientes cifras, expresadas en millones de MXN.

| Concepto | Presupuesto | Real | Variación | Variación % |
|---|---:|---:|---:|---:|
| Ingresos | $50 | $54 | +$4 | +8.00% |
| Costo de ventas | $30 | $35 | +$5 | +16.67% |
| Gastos operativos | $12 | $13 | +$1 | +8.33% |
| Utilidad operativa | $8 | $6 | -$2 | -25.00% |

#### Diagnóstico

Aunque los ingresos superaron el presupuesto en un 8%, la utilidad operativa terminó un 25% por debajo de lo esperado.

El costo de ventas aumentó proporcionalmente más que los ingresos, deteriorando los márgenes.

- Margen bruto presupuestado: 40.00%.
- Margen bruto real: 35.19%.
- Margen operativo presupuestado: 16.00%.
- Margen operativo real: 11.11%.

#### Conclusión

Una desviación favorable en ingresos no garantiza un resultado favorable en rentabilidad.

Es necesario identificar las causas de los incrementos de costos y gastos, distinguiendo los efectos del volumen de actividad de las posibles ineficiencias.

---

### Caso práctico 2 — Presupuesto flexible

Se utilizó una proporción presupuestada de costo de ventas equivalente al 60% de los ingresos.

#### Cálculos

Ingresos reales: $54 millones.

Costo ajustado:

54 × 60% = **$32.4 millones**

Costo real: $35 millones.

Desviación desfavorable:

35 - 32.4 = **$2.6 millones**

Variación porcentual:

2.6 / 32.4 × 100 = **8.02%**

#### Descomposición de la variación

| Concepto | Millones MXN |
|---|---:|
| Incremento total del costo de ventas | $5.0 |
| Ajuste proporcional por mayores ingresos | $2.4 |
| Desviación respecto al presupuesto flexible | $2.6 |

#### Análisis de causas

Para profundizar en el ejercicio, se planteó una descomposición hipotética de los $2.6 millones:

- Incrementos de precios de proveedores: $1.8 millones.
- Desperdicios y errores operativos: $0.8 millones.

#### Recomendaciones

1. Corregir los procesos internos que generan desperdicios.
2. Revisar contratos, condiciones y precios de proveedores.
3. Evaluar proveedores alternativos.
4. Analizar la rentabilidad por producto.
5. Revisar la política comercial y los precios de venta.
6. Medir los resultados de las acciones correctivas.

#### Conclusión

El presupuesto flexible permite distinguir el incremento proporcional de costos asociado al nivel de actividad de otras desviaciones.

La diferencia restante requiere investigación antes de atribuirla a ineficiencias específicas.

---

### Caso práctico 3 — Análisis costo-volumen-utilidad

#### Datos iniciales

| Concepto | Importe |
|---|---:|
| Precio de venta unitario | $1,000 |
| Costo variable unitario | $650 |
| Costos fijos mensuales | $700,000 |
| Ventas mensuales | 2,500 unidades |

#### Resultados

Margen de contribución unitario:

1,000 - 650 = **$350**

Punto de equilibrio:

700,000 / 350 = **2,000 unidades**

Utilidad operativa:

(2,500 × 350) - 700,000 = **$175,000**

Unidades necesarias para una utilidad de $350,000:

(700,000 + 350,000) / 350 = **3,000 unidades**

Unidades adicionales requeridas:

3,000 - 2,500 = **500 unidades**

#### Escenario de incremento de costos fijos

Se evaluó un aumento de costos fijos mensuales a $800,000.

Nueva utilidad operativa:

(2,500 × 350) - 800,000 = **$75,000**

Unidades necesarias para obtener $350,000 de utilidad:

(800,000 + 350,000) / 350 = 3,285.71

Redondeando hacia arriba: **3,286 unidades**

Unidades adicionales requeridas: **786**

#### Conclusión

El margen de contribución permite determinar cuánto aporta cada unidad vendida a la cobertura de costos fijos y a la generación de utilidad.

El análisis costo-volumen-utilidad facilita establecer metas comerciales, evaluar cambios de costos y calcular puntos de equilibrio.

---


### Caso práctico 4 — Forecast anual de ventas

#### Situación inicial

Se evaluó el cumplimiento del presupuesto anual de una empresa, considerando las ventas acumuladas y la proyección de los últimos tres meses.

| Concepto | Millones MXN |
|---|---:|
| Presupuesto anual | $120 |
| Ventas reales enero–septiembre | $84 |
| Forecast mensual octubre–diciembre | $11 |
| Forecast total del último trimestre | $33 |
| Forecast anual | $117 |

#### Cálculos

Forecast anual:

84 + (11 × 3) = **$117 millones**

Variación contra presupuesto:

117 - 120 = **-$3 millones**

Variación porcentual:

-3 / 120 × 100 = **-2.50%**

Cumplimiento proyectado:

117 / 120 × 100 = **97.50%**

#### Validación del forecast

Promedio mensual enero–septiembre:

84 / 9 = **$9.33 millones**

Incremento esperado del forecast mensual respecto al promedio histórico:

(11 - 9.3333) / 9.3333 × 100 = **17.86%**

Este crecimiento esperado debe sustentarse en información comercial, estacionalidad, contratos o tendencias verificables.

#### Diagnóstico

La empresa proyecta cerrar el ejercicio $3 millones por debajo del presupuesto anual.

Para alcanzar la meta, necesita generar $36 millones durante el último trimestre, equivalentes a $12 millones mensuales.

Esto representa un incremento de $1 millón mensual respecto al forecast original.

#### Conclusión

El forecasting permite anticipar desviaciones respecto a los objetivos anuales y preparar acciones correctivas antes del cierre del periodo.

Es indispensable verificar la periodicidad, las unidades de medida y los supuestos de cada proyección.

---

### Caso práctico 5 — Evaluación financiera de campaña comercial

#### Situación inicial

Se propuso implementar una campaña comercial para recuperar los $3 millones faltantes del presupuesto anual.

| Concepto | Importe |
|---|---:|
| Ventas incrementales esperadas | $3,000,000 |
| Margen de contribución esperado | 30% |
| Costo de campaña | $400,000 |

#### Evaluación financiera

Margen de contribución incremental:

3,000,000 × 30% = **$900,000**

Beneficio operativo incremental estimado:

900,000 - 400,000 = **$500,000**

#### Punto de equilibrio de la campaña

Ventas incrementales mínimas para recuperar el costo:

400,000 / 30% = **$1,333,333.33**

La campaña requiere generar aproximadamente $1.33 millones en ventas adicionales para cubrir su inversión, bajo los supuestos establecidos.

#### Análisis de escenarios

| Escenario | Ventas incrementales | Beneficio incremental |
|---|---:|---:|
| Conservador | $1,000,000 | -$100,000 |
| Objetivo | $3,000,000 | +$500,000 |

#### Información requerida para autorizar la inversión

1. Resultados históricos de campañas similares.
2. Número de clientes potenciales y tasa de conversión.
3. Ticket promedio y frecuencia de compra.
4. Costos variables y descuentos comerciales.
5. Capacidad operativa para atender la demanda.
6. Evidencia de que las ventas serían realmente incrementales.
7. Riesgos de ejecución y escenarios alternativos.

#### Recomendación ejecutiva

No aprobar automáticamente la campaña únicamente por su escenario optimista.

Se recomienda validar los supuestos comerciales, estimar la probabilidad de alcanzar las ventas incrementales y, cuando sea viable, realizar una prueba piloto antes de comprometer la totalidad del presupuesto.

La decisión debe considerar la rentabilidad incremental, el riesgo y el costo de oportunidad de los recursos.

#### Conclusión

Una inversión comercial debe evaluarse por el beneficio incremental esperado y la calidad de los supuestos que lo sustentan, no solamente por el crecimiento proyectado de ingresos.

---

### Evaluación del Bloque 2

**Fecha de cierre:** 13 de noviembre de 2026  
**Evaluación formativa:** 8.0/10  
**Estado:** Prácticas completadas; pendiente de validación del mentor.

#### Competencias desarrolladas

- Comparación de presupuestos contra resultados reales.
- Cálculo de variaciones absolutas y porcentuales.
- Interpretación de desviaciones favorables y desfavorables.
- Elaboración de presupuestos flexibles.
- Análisis de costos y márgenes.
- Cálculo de puntos de equilibrio y utilidades objetivo.
- Construcción e interpretación de forecasts.
- Evaluación de campañas comerciales.
- Análisis de escenarios y rentabilidad incremental.
- Formulación de recomendaciones financieras.

#### Fortalezas identificadas

- Capacidad para identificar desviaciones relevantes.
- Criterio para investigar causas antes de emitir conclusiones.
- Comprensión de la relación entre costos, precios y rentabilidad.
- Enfoque comercial orientado a resultados.
- Capacidad para cuestionar supuestos de inversión.
- Identificación de acciones correctivas operativas y comerciales.

#### Oportunidades de mejora

**1. Precisión en las variaciones porcentuales**

Se reforzó la utilización del presupuesto como base para calcular desviaciones presupuestarias.

**2. Interpretación de la periodicidad**

Se corrigió una interpretación inicial del forecast mensual, diferenciando cifras acumuladas y proyecciones por periodo.

**3. Margen de contribución y utilidad operativa**

Se reforzó la diferencia entre contribución total, costos fijos y utilidad operativa.

**4. Validación de escenarios**

Se identificó la importancia de respaldar las proyecciones comerciales con datos históricos, supuestos verificables y pruebas piloto.

#### Aprendizaje principal

El análisis presupuestario no consiste únicamente en identificar diferencias entre lo planeado y lo ejecutado.

Un analista financiero debe explicar las desviaciones, determinar sus causas, evaluar escenarios y proponer decisiones que mejoren el uso de los recursos.

#### Pendientes de revisión con el mentor

- Validar los ejercicios de presupuesto flexible.
- Revisar los modelos de costo-volumen-utilidad.
- Evaluar la calidad de los supuestos utilizados en forecasting.
- Reforzar el análisis cuantitativo de escenarios y riesgos.
- Revisar las recomendaciones ejecutivas formuladas.

**Conclusión del Bloque 2:**

Se completaron los ejercicios de presupuestos, variaciones, costos, punto de equilibrio, forecasting y evaluación de inversiones comerciales.

El bloque queda documentado y pendiente de validación formal por el mentor.

---

# Bloque 3 — Proyecciones financieras y análisis de escenarios

**Estado:** Completado y aprobado  
**Fecha:** 16 de noviembre de 2026

## Objetivo

Desarrollar modelos financieros para proyectar ingresos, costos, gastos y utilidad operativa, evaluar escenarios de negocio y proponer medidas para proteger la rentabilidad.

## Actividades realizadas

### Proyección financiera 2027

Se utilizaron los resultados reales de 2026 como base:

- Ingresos: $120,000,000
- Costo de ventas: $72,000,000
- Gastos operativos: $30,000,000
- Utilidad operativa: $18,000,000
- Margen operativo: 15%

Bajo supuestos de crecimiento del 12% en ingresos, 15% en costos y 8% en gastos operativos, se obtuvo:

- Ingresos proyectados: $134,400,000
- Costos proyectados: $82,800,000
- Gastos operativos: $32,400,000
- Utilidad operativa: $19,200,000
- Margen operativo: 14.29%

**Hallazgo:** Aunque la utilidad absoluta aumenta, el margen operativo disminuye debido al crecimiento proporcionalmente mayor de los costos.

Para conservar un margen del 15%, se determinó un costo de ventas máximo de $81,840,000 y un ahorro necesario de $960,000.

### Análisis de escenarios

| Indicador | Pesimista | Base | Optimista |
|---|---:|---:|---:|
| Ingresos | $126.00 M | $134.40 M | $141.60 M |
| Costos | $83.52 M | $82.80 M | $79.20 M |
| Gastos | $33.60 M | $32.40 M | $31.80 M |
| Utilidad operativa | $8.88 M | $19.20 M | $30.60 M |
| Margen operativo | 7.05% | 14.29% | 21.61% |

En el escenario pesimista se planteó recuperar un margen operativo del 12%, identificando:

- Utilidad mínima requerida: $15,120,000
- Costo de ventas máximo: $77,280,000
- Ahorro necesario: $6,240,000
- Reducción requerida sobre costos proyectados: 7.47%

**Conclusión:** Las decisiones de rentabilidad deben basarse en escenarios cuantificados, seguimiento de costos y medidas comerciales y operativas verificables.

## Aprendizajes

- Construcción de proyecciones financieras.
- Análisis de escenarios y sensibilidad.
- Diferencia entre crecimiento de utilidad y mejora de margen.
- Cálculo de costos máximos para alcanzar márgenes objetivo.
- Formulación de recomendaciones financieras.

**Evaluación del bloque: 8.5/10.**

---

# Bloque 4 — Evaluación financiera de inversiones

**Estado:** Completado y aprobado  
**Fecha:** 16 de noviembre de 2026

## Objetivo

Evaluar proyectos de inversión mediante contribución marginal, utilidad operativa incremental, margen operativo, recuperación simple de inversión y valor actual neto (VAN).

## Metodología

Se realizaron tres ejercicios: uno guiado y dos independientes, con revisión y corrección de resultados.

### Caso 1 — Nuevo canal de distribución

- Ingresos anuales: $24,000,000
- Costos variables: 65%
- Gastos operativos: $4,200,000
- Inversión inicial: $6,000,000
- Horizonte: 3 años

**Resultados:**

- Contribución marginal anual: $8,400,000
- Utilidad operativa anual: $4,200,000
- Payback simple: 1.43 años

### Caso 2 — Expansión comercial

- Ingresos anuales: $36,000,000
- Costos variables: 58%
- Gastos operativos: $6,600,000
- Inversión inicial: $12,000,000
- Horizonte: 4 años

**Resultados:**

- Contribución marginal: $15,120,000
- Margen de contribución: 42%
- Utilidad operativa anual: $8,520,000
- Margen operativo: 23.67%
- Payback: 1.41 años
- Recuperación en el primer año: 71%
- Flujo acumulado en cuatro años: $34,080,000
- Excedente simple después de inversión: $22,080,000

### Caso 3 — Nuevo servicio empresarial

- Ingresos anuales: $48,000,000
- Costos variables: 62%
- Gastos operativos: $7,800,000
- Inversión inicial: $18,000,000
- Horizonte: 5 años
- Tasa de descuento: 12%

**Resultados:**

- Contribución marginal: $18,240,000
- Margen de contribución: 38%
- Utilidad operativa anual: $10,440,000
- Margen operativo: 21.75%
- Payback: 1.72 años
- Recuperación en el primer año: 58%
- Flujo acumulado en cinco años: $52,200,000
- Excedente simple después de inversión: $34,200,000
- VAN: $19,633,863.55

El VAN positivo indica que el proyecto crea valor bajo los supuestos establecidos y una tasa de descuento del 12%.

## Aprendizajes

- Diferencia entre utilidad anual y recuperación de inversión.
- Distinción entre flujo acumulado y excedente neto simple.
- Uso de la función NPV de Excel.
- Descuento individual de flujos según el periodo.
- Interpretación de riesgos y viabilidad financiera.

**Evaluación del bloque: 8.5/10.**

---

# Cierre de la Unidad 8

**Fecha de cierre académico:** 16 de noviembre de 2026  
**Estado:** Aprobada  
**Calificación formativa:** 8.5/10

## Competencias desarrolladas

- Presupuestación y análisis de variaciones.
- Proyecciones financieras.
- Análisis de rentabilidad y escenarios.
- Evaluación de proyectos de inversión.
- Interpretación ejecutiva de indicadores.
- Modelado financiero en Excel.

## Aspectos por reforzar

- Precisión de referencias y fórmulas.
- Diferenciación entre utilidad, flujo de efectivo y valor presente.
- Validación de supuestos financieros.
- Presentación de conclusiones ejecutivas.
- Modelos dinámicos y análisis de sensibilidad.

**Siguiente unidad:** Unidad 9 — Proyecto profesional de portafolio.

