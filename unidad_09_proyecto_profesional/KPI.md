# Diccionario de KPI — Finanzas, ventas y análisis empresarial

**Programa:** Data Analyst · Unidades 9 y 10  
**Versión:** 1.0 · 17 de noviembre de 2026  
**Uso:** Referencia de estudio y consulta durante proyectos *open book*.

## Cómo utilizar este diccionario

Un **KPI** (*Key Performance Indicator*) es un indicador cuantificable vinculado a un objetivo y una decisión. Una cifra aislada (por ejemplo, costo de mercancía) es una métrica; se convierte en un KPI cuando se define una meta, un periodo, un responsable y un uso para tomar decisiones.

**Convenciones:** importes en MXN; los porcentajes se multiplican por 100; **ventas netas** son ventas después de descuentos y devoluciones; **COGS** es costo de mercancía vendida; **utilidad bruta = ventas netas − COGS**; **utilidad operativa = utilidad bruta − gastos operativos** (en los ejemplos simplificados); **promedio** de un saldo = (saldo inicial + saldo final)/2. Los ejemplos son independientes y ficticios, no constituyen estados financieros de una sola empresa. Las fórmulas deben adaptarse a políticas contables, periodo, impuestos y disponibilidad de datos.

**Precauciones:** nunca dividas entre cero; indica el periodo y la unidad de medida; compara periodos equivalentes; verifica si los datos incluyen impuestos, descuentos, cancelaciones y devoluciones; no confundas ingreso con cobro ni utilidad con flujo de efectivo. Un KPI no tiene un valor “bueno” universal: depende de industria, estrategia y comparación histórica.

---

## A. Ventas y desempeño comercial (1–5)

### 1. Ventas netas
- **Definición:** ingreso comercial reconocido después de descuentos, devoluciones y bonificaciones.
- **Fórmula:** `Ventas brutas − descuentos − devoluciones − bonificaciones`.
- **Uso:** dimensionar el ingreso real y compararlo contra objetivos.
- **Ejemplo:** 1,000,000 − 50,000 − 30,000 − 20,000 = **900,000**.
- **Interpretación:** se reconocen 900,000 de ventas netas; no significa que se hayan cobrado ni que sean utilidad.

### 2. Crecimiento de ventas (%)
- **Definición:** variación relativa de ventas entre periodos comparables.
- **Fórmula:** `(Ventas actuales − ventas anteriores) / ventas anteriores × 100`.
- **Uso:** evaluar expansión o contracción comercial.
- **Ejemplo:** (1,100,000 − 1,000,000) / 1,000,000 × 100 = **10%**.
- **Interpretación:** ventas crecieron 10%; aún falta comprobar si el margen mejoró.

### 3. Ticket promedio
- **Definición:** venta neta media por transacción válida.
- **Fórmula:** `Ventas netas / número de transacciones`.
- **Uso:** analizar valor de compra y estrategias de venta cruzada.
- **Ejemplo:** 900,000 / 300 = **3,000 por transacción**.
- **Interpretación:** cada operación aportó en promedio 3,000; puede subir por precio, mezcla o mayor cantidad de productos.

### 4. Unidades por transacción
- **Definición:** número promedio de unidades vendidas por operación.
- **Fórmula:** `Unidades netas vendidas / número de transacciones`.
- **Uso:** evaluar profundidad de compra y venta complementaria.
- **Ejemplo:** 1,200 / 300 = **4 unidades por transacción**.
- **Interpretación:** cada operación incluyó cuatro unidades en promedio; no informa por sí sola la rentabilidad.

### 5. Cumplimiento de meta de ventas (%)
- **Definición:** proporción de la meta comercial alcanzada.
- **Fórmula:** `Ventas reales / meta de ventas × 100`.
- **Uso:** dar seguimiento a objetivos y decidir acciones correctivas.
- **Ejemplo:** 950,000 / 1,000,000 × 100 = **95%**.
- **Interpretación:** se alcanzó 95% de la meta y existe una brecha de 50,000; superar 100% no garantiza mayor utilidad.

---

## B. Rentabilidad (6–11)

### 6. Utilidad bruta
- **Definición:** resultado después de restar el costo de ventas, antes de gastos operativos.
- **Fórmula:** `Ventas netas − COGS`.
- **Uso:** cuantificar el beneficio generado por los productos antes de operar el negocio.
- **Ejemplo:** 1,000,000 − 650,000 = **350,000**.
- **Interpretación:** quedan 350,000 para cubrir gastos operativos y otros conceptos; no es utilidad neta.

### 7. Margen bruto (%)
- **Definición:** proporción de ventas netas que permanece después del costo de ventas.
- **Fórmula:** `Utilidad bruta / ventas netas × 100`.
- **Uso:** comparar rentabilidad de productos, regiones o periodos con tamaños distintos.
- **Ejemplo:** 350,000 / 1,000,000 × 100 = **35%**.
- **Interpretación:** por cada 100 vendidos quedan 35 antes de gastos operativos; un margen mayor suele favorecer la rentabilidad, manteniendo lo demás constante.

### 8. Utilidad operativa
- **Definición:** resultado de las operaciones principales antes de intereses e impuestos.
- **Fórmula simplificada:** `Utilidad bruta − gastos operativos`.
- **Uso:** medir cuánto genera la operación tras cubrir sus gastos.
- **Ejemplo:** 350,000 − 200,000 = **150,000**.
- **Interpretación:** el negocio genera 150,000 operativos; la definición contable exacta depende de las partidas incluidas.

### 9. Margen operativo (%)
- **Definición:** utilidad operativa como porcentaje de ventas netas.
- **Fórmula:** `Utilidad operativa / ventas netas × 100`.
- **Uso:** comparar eficiencia económica entre unidades de negocio.
- **Ejemplo:** 150,000 / 1,000,000 × 100 = **15%**.
- **Interpretación:** por cada 100 vendidos quedan 15 de utilidad operativa; útil para detectar crecimiento con deterioro de margen.

### 10. Margen neto (%)
- **Definición:** porcentaje de ventas que termina como utilidad neta.
- **Fórmula:** `Utilidad neta / ventas netas × 100`.
- **Uso:** evaluar rentabilidad final después de gastos, financiamiento e impuestos.
- **Ejemplo:** 90,000 / 1,000,000 × 100 = **9%**.
- **Interpretación:** quedan 9 de utilidad neta por cada 100 de ventas; no equivale a efectivo disponible.

### 11. Margen de contribución (%)
- **Definición:** porcentaje de ventas que queda tras cubrir costos variables.
- **Fórmula:** `(Ventas netas − costos variables) / ventas netas × 100`.
- **Uso:** analizar precios, mezcla, punto de equilibrio y decisiones incrementales.
- **Ejemplo:** (500,000 − 300,000) / 500,000 × 100 = **40%**.
- **Interpretación:** cada 100 vendidos aportan 40 a costos fijos y resultado; no es lo mismo que margen bruto si COGS incluye costos fijos.

---

## C. Costos y eficiencia (12–16)

### 12. COGS sobre ventas (%)
- **Definición:** proporción de las ventas consumida por el costo de mercancía vendida.
- **Fórmula:** `COGS / ventas netas × 100`.
- **Uso:** controlar costos de producto y evaluar negociación con proveedores.
- **Ejemplo:** 650,000 / 1,000,000 × 100 = **65%**.
- **Interpretación:** 65 de cada 100 vendidos cubren mercancía; bajo definiciones consistentes, el margen bruto es 35%.

### 13. Gastos operativos sobre ventas (%)
- **Definición:** porcentaje de ingresos destinado a gastos operativos.
- **Fórmula:** `Gastos operativos / ventas netas × 100`.
- **Uso:** analizar estructura de gastos y escalabilidad.
- **Ejemplo:** 200,000 / 1,000,000 × 100 = **20%**.
- **Interpretación:** por cada 100 vendidos se gastan 20 en operación; comparar con márgenes y necesidades del negocio.

### 14. Costo operativo por transacción
- **Definición:** gasto operativo promedio asociado a cada operación.
- **Fórmula:** `Gastos operativos atribuibles / número de transacciones`.
- **Uso:** evaluar eficiencia de procesos y canales.
- **Ejemplo:** 120,000 / 400 = **300 por transacción**.
- **Interpretación:** operar cada transacción cuesta en promedio 300; requiere criterios consistentes para asignar gastos comunes.

### 15. Rotación de inventario (veces)
- **Definición:** cuántas veces se renueva el inventario en el periodo.
- **Fórmula:** `COGS del periodo / inventario promedio a costo`.
- **Uso:** detectar inventario inmovilizado o problemas de abastecimiento.
- **Ejemplo:** 1,200,000 / 300,000 = **4 veces al año**.
- **Interpretación:** el inventario rota aproximadamente cuatro veces al año; una rotación muy alta también puede indicar riesgo de faltantes.

### 16. Días de inventario (DIO)
- **Definición:** días promedio que permanece el inventario antes de venderse.
- **Fórmula:** `Inventario promedio / COGS × días del periodo`.
- **Uso:** gestionar capital de trabajo y compras.
- **Ejemplo:** 300,000 / 1,200,000 × 365 = **91.25 días**.
- **Interpretación:** hay aproximadamente 91 días de inventario; el nivel deseable depende del producto y suministro.

---

## D. Clientes y cartera comercial (17–21)

### 17. Clientes activos
- **Definición:** clientes distintos con al menos una transacción válida en el periodo.
- **Fórmula:** `COUNT(DISTINCT id_cliente)` filtrando operaciones válidas.
- **Uso:** medir alcance comercial real.
- **Ejemplo:** 800 clientes registrados, 520 con compras = **520 activos**.
- **Interpretación:** 520 compraron en el periodo; el padrón completo no equivale a cartera activa.

### 18. Ingreso promedio por cliente activo
- **Definición:** ventas netas promedio por cliente comprador.
- **Fórmula:** `Ventas netas / clientes activos`.
- **Uso:** analizar valor de cartera y segmentación.
- **Ejemplo:** 2,600,000 / 520 = **5,000 por cliente**.
- **Interpretación:** cada cliente activo genera 5,000 en promedio; la distribución puede estar muy concentrada.

### 19. Retención de clientes (%)
- **Definición:** proporción de clientes del inicio que continúan activos al final del periodo.
- **Fórmula:** `Clientes del grupo inicial que siguen activos al final / clientes activos al inicio × 100`.
- **Uso:** evaluar fidelización; requiere definir qué significa “activo”.
- **Ejemplo:** 160 de 200 clientes iniciales siguen activos = **80%**.
- **Interpretación:** se retuvo 80% de la cohorte inicial; nuevos clientes no deben inflar el numerador.

### 20. Tasa de devolución (%)
- **Definición:** proporción del valor bruto vendido que fue devuelto, según política de atribución temporal.
- **Fórmula:** `Importe de devoluciones / ventas brutas × 100`.
- **Uso:** detectar problemas de calidad, producto o servicio.
- **Ejemplo:** 40,000 / 1,000,000 × 100 = **4%**.
- **Interpretación:** se devolvió valor equivalente a 4% de ventas brutas; documentar si se mide por valor, unidades u operaciones.

### 21. Concentración de ventas en Top 10 clientes (%)
- **Definición:** peso de los diez mayores clientes sobre las ventas totales.
- **Fórmula:** `Ventas netas de los 10 mayores clientes / ventas netas totales × 100`.
- **Uso:** identificar dependencia comercial y riesgo de concentración.
- **Ejemplo:** 600,000 / 1,500,000 × 100 = **40%**.
- **Interpretación:** diez clientes aportan 40% de ventas; perder alguno puede afectar resultados de forma significativa.

---

## E. Presupuesto y planeación (22–26)

### 22. Variación presupuestaria de ingresos ($)
- **Definición:** diferencia entre ventas reales y presupuestadas.
- **Fórmula:** `Ventas reales − ventas presupuestadas`.
- **Uso:** cuantificar el excedente o faltante de ingresos.
- **Ejemplo:** 950,000 − 1,000,000 = **−50,000**.
- **Interpretación:** faltaron 50,000 frente al presupuesto; para ingresos, una variación negativa suele ser desfavorable.

### 23. Variación presupuestaria de ingresos (%)
- **Definición:** desviación relativa de ventas respecto al presupuesto.
- **Fórmula:** `(Ventas reales − ventas presupuestadas) / ventas presupuestadas × 100`.
- **Uso:** comparar desviaciones entre unidades de distinto tamaño.
- **Ejemplo:** (950,000 − 1,000,000) / 1,000,000 × 100 = **−5%**.
- **Interpretación:** ventas quedaron 5% por debajo de lo planeado; distinta del cumplimiento de 95%.

### 24. Variación de gastos (%)
- **Definición:** desviación relativa del gasto real contra el presupuestado.
- **Fórmula:** `(Gasto real − gasto presupuestado) / gasto presupuestado × 100`.
- **Uso:** vigilar sobrecostos y explicar diferencias de utilidad.
- **Ejemplo:** (220,000 − 200,000) / 200,000 × 100 = **+10%**.
- **Interpretación:** el gasto superó 10% el presupuesto; normalmente desfavorable, salvo que respalde actividad rentable adicional.

### 25. Error porcentual absoluto de pronóstico (APE)
- **Definición:** error relativo absoluto de un pronóstico individual.
- **Fórmula:** `|Real − pronóstico| / |Real| × 100` (si real ≠ 0).
- **Uso:** evaluar precisión de una proyección puntual.
- **Ejemplo:** |110,000 − 100,000| / 110,000 × 100 = **9.09%**.
- **Interpretación:** el pronóstico se desvió 9.09% del real; menor es mejor. Para múltiples periodos, puede usarse MAPE con precaución ante reales cercanos a cero.

### 26. Punto de equilibrio (unidades)
- **Definición:** unidades necesarias para cubrir costos fijos, sin utilidad ni pérdida operativa bajo supuestos lineales.
- **Fórmula:** `Costos fijos / (precio unitario − costo variable unitario)`.
- **Uso:** evaluar volumen mínimo y viabilidad de precios.
- **Ejemplo:** 100,000 / (500 − 300) = **500 unidades**.
- **Interpretación:** vender 500 unidades cubre costos fijos; requiere margen de contribución unitario positivo y supuestos estables.

---

## F. Finanzas corporativas e inversión (27–30)

### 27. EBITDA y margen EBITDA
- **Definición:** resultado antes de intereses, impuestos, depreciación y amortización; su cálculo y conciliación deben documentarse.
- **Fórmula simplificada:** `Utilidad operativa (EBIT) + depreciación + amortización`; `Margen EBITDA = EBITDA / ventas netas × 100`.
- **Uso:** comparar desempeño operativo antes de partidas no monetarias específicas.
- **Ejemplo:** EBIT 150,000 + depreciación 30,000 + amortización 20,000 = **EBITDA 200,000**; sobre ventas de 1,000,000 = **20%**.
- **Interpretación:** margen EBITDA de 20%; **EBITDA no es flujo de caja**, pues excluye cambios de capital de trabajo e inversiones.

### 28. Retorno sobre inversión (ROI simple)
- **Definición:** retorno relativo respecto a la inversión, con una definición explícita de beneficio y horizonte.
- **Fórmula:** `(Beneficio atribuible − inversión) / inversión × 100` cuando “beneficio” representa entradas acumuladas antes de recuperar la inversión.
- **Uso:** comparación inicial de proyectos; no incorpora valor temporal del dinero.
- **Ejemplo:** entradas netas acumuladas de 150,000 frente a inversión de 100,000: (150,000 − 100,000) / 100,000 × 100 = **50%**.
- **Interpretación:** excedente simple del 50% en el horizonte analizado; no equivale a tasa anual ni sustituye VAN.

### 29. Valor actual neto (VAN / NPV)
- **Definición:** valor presente de flujos futuros menos inversión inicial.
- **Fórmula:** `VAN = −I₀ + Σ[FC_t / (1+r)^t]` para t = 1…n.
- **Uso:** evaluar creación de valor de inversiones usando tasa de descuento adecuada.
- **Ejemplo:** inversión inicial 100,000; flujo de 60,000 al final de cada uno de dos años; tasa 10%: −100,000 + 60,000/1.10 + 60,000/1.10² = **4,132.23**.
- **Interpretación:** VAN positivo de 4,132.23 indica creación de valor bajo esos flujos y tasa; un VAN negativo indica destrucción de valor frente a esa tasa. En Excel, el desembolso en t=0 se suma fuera de `NPV()`.

### 30. Periodo de recuperación (Payback simple)
- **Definición:** tiempo necesario para recuperar inversión inicial con flujos acumulados no descontados.
- **Fórmula con flujos constantes:** `Inversión inicial / flujo neto anual`; con flujos variables, acumular hasta recuperar la inversión.
- **Uso:** evaluar rapidez de recuperación y exposición de liquidez.
- **Ejemplo:** 120,000 / 40,000 anuales = **3 años**.
- **Interpretación:** la inversión se recupera en tres años bajo flujos constantes; no mide creación de valor ni considera flujos posteriores o descuento.

---

## Mini-caso de aplicación: Norte vs. Sur (Unidad 9)

| Concepto | Norte | Sur |
|---|---:|---:|
| Ventas netas | 25,000,000 | 18,000,000 |
| COGS | 19,000,000 | 11,000,000 |
| Gastos operativos | 4,000,000 | 3,500,000 |
| Operaciones | 2,500 | 1,200 |
| Utilidad bruta | 6,000,000 | 7,000,000 |
| Margen bruto | 24.00% | 38.89% |
| Utilidad operativa | 2,000,000 | 3,500,000 |
| Margen operativo | 8.00% | 19.44% |
| Ticket promedio | 10,000 | 15,000 |
| Gastos operativos / ventas | 16.00% | 19.44% |

**Lectura ejecutiva:** Norte vende más (25 M vs. 18 M), pero Sur genera más utilidad operativa (3.5 M vs. 2 M) y un mayor margen operativo (19.44% vs. 8%). No significa automáticamente que haya que retirar inversión de Norte: antes habría que investigar capacidad, crecimiento, riesgo, asignación de gastos y retorno incremental de la inversión.

## Guía para elegir un KPI

1. **¿Qué decisión se necesita tomar?** (precio, inversión, inventario, clientes, presupuesto).
2. **¿Qué resultado interesa medir?** (crecimiento, rentabilidad, eficiencia, riesgo).
3. **¿Qué datos se necesitan y cómo se definen?** (periodo, neto/bruto, costos, transacciones válidas).
4. **¿Cuál es la fórmula y la unidad?** (MXN, %, días, veces, unidades).
5. **¿Contra qué se compara?** (meta, año anterior, otra región, benchmark válido).
6. **¿Qué acción concreta cambiaría según el resultado?** Si ninguna, probablemente no es un KPI prioritario.

## Lista corta para la Unidad 9

Priorizar: **ventas netas, crecimiento de ventas, utilidad bruta, margen bruto, utilidad operativa, margen operativo, ticket promedio, gastos operativos/ventas, cumplimiento de meta y variación presupuestaria**. Otros KPI se incorporan si el dataset permite calcularlos de forma confiable.

**Regla de evaluación:** puedes consultar este documento durante desarrollo *open book*. En la defensa técnica deberás explicar qué mide el KPI, sus componentes, cómo interpretarlo y qué limitaciones tiene, sin depender de memorizar su redacción.

