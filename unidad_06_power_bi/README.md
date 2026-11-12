# Unidad 6 — Power BI: Análisis de Cartera PyME

## 1. Objetivo del proyecto

Desarrollar un dashboard interactivo en Power BI para analizar una cartera de créditos PyME, integrando información de clientes, créditos y pagos mediante un modelo de datos relacional.

El propósito es transformar datos operativos en indicadores financieros que permitan evaluar la composición de la cartera, dar seguimiento a la recuperación de pagos e identificar información relevante para la toma de decisiones comerciales y crediticias.

## 2. Descripción del proyecto

El proyecto utiliza tres archivos CSV con datos completamente simulados:

- `clientes.csv`: información de 500 clientes.
- `creditos.csv`: información de 1,000 créditos.
- `pagos.csv`: información de 5,011 movimientos de pago.

Los archivos se integran en Power BI mediante relaciones entre las tablas de clientes, créditos y pagos. A partir de este modelo se construyó un dashboard de seguimiento de cartera PyME.

**Nota:** Los datos son sintéticos y no corresponden a clientes, empresas ni operaciones reales.


## 3. Modelo de datos y relaciones

Se construyó un modelo relacional con tres tablas:

- **clientes:** contiene los datos de identificación y clasificación de cada cliente. Su llave primaria es `id_cliente`.
- **creditos:** contiene las operaciones crediticias. Su llave primaria es `id_credito` y utiliza `id_cliente` como llave foránea.
- **pagos:** registra los movimientos de pago. Su llave primaria es `id_pago` y utiliza `id_credito` como llave foránea.

### Relaciones

1. `clientes[id_cliente]` (1) → (*) `creditos[id_cliente]`
2. `creditos[id_credito]` (1) → (*) `pagos[id_credito]`

Estas relaciones permiten analizar los créditos asociados a cada cliente y sus respectivos movimientos de pago.

El modelo busca evitar duplicidades en las agregaciones y facilitar el cálculo de indicadores financieros mediante medidas DAX.

### Consideraciones de calidad de datos

Se revisó la importancia de identificar llaves únicas, validar la integridad referencial y distinguir entre el número de clientes, el número de créditos y la cantidad de movimientos de pago.

Todos los registros corresponden a un conjunto de datos simulado.



## 4. Medidas DAX e indicadores financieros

Se desarrollaron seis medidas DAX para analizar el volumen, saldo, recuperación y morosidad de la cartera PyME.

### 4.1 Total Créditos

```dax
Total Creditos = DISTINCTCOUNT(creditos[id_credito])
```

Cuenta las operaciones crediticias únicas, evitando duplicidades en el conteo.

**Resultado:** 1,000 créditos.

### 4.2 Saldo Total

```dax
Saldo Total = SUM(creditos[saldo_actual])
```

Calcula el saldo vigente de las operaciones registradas, incluyendo créditos con diferentes estatus.

**Resultado:** $313.07 millones MXN.

### 4.3 Pagos Recibidos

```dax
Pagos Recibidos = SUM(pagos[monto_pago])
```

Suma los movimientos de pago registrados para analizar la recuperación acumulada en los datos disponibles.

**Resultado:** $131.52 millones MXN.

### 4.4 Monto Colocado

```dax
Monto Colocado = SUM(creditos[monto_original])
```

Calcula el monto original de los créditos registrados en la cartera.

**Resultado:** $543.38 millones MXN.

### 4.5 Cartera Vencida

```dax
Cartera Vencida =
CALCULATE(
    SUM(creditos[saldo_actual]),
    creditos[estatus] = "Vencido"
)
```

Suma los saldos de créditos clasificados con estatus "Vencido".

**Resultado:** $80.45 millones MXN.

### 4.6 Indice Morosidad

```dax
Indice Morosidad =
DIVIDE(
    [Cartera Vencida],
    [Saldo Total],
    0
)
```

Calcula la proporción de cartera vencida respecto al saldo total.

**Resultado:** 25.70%.

### Interpretación financiera

El dashboard muestra una cartera con saldo total de $313.07 millones, de los cuales aproximadamente $80.45 millones están clasificados como vencidos.

El índice de morosidad de 25.70% representa una exposición relevante que amerita analizar la concentración por región, sector económico y tipo de crédito.

Los indicadores son dinámicos y responden al contexto de filtros del reporte.

**Limitación:** El índice depende de la clasificación de estatus incluida en los datos simulados. No debe interpretarse automáticamente como un índice regulatorio de morosidad sin validar sus criterios de clasificación.



## 5. Visualizaciones y análisis ejecutivo

Se desarrolló un dashboard ejecutivo en Power BI para analizar la cartera de crédito PyME desde distintas perspectivas comerciales y financieras.

### 5.1 Indicadores principales (KPI)

El dashboard presenta seis indicadores:

- Saldo total: $313.07 millones MXN.
- Monto original colocado: $543.38 millones MXN.
- Pagos recibidos: $131.52 millones MXN.
- Cartera vencida: $80.45 millones MXN.
- Índice de morosidad: 25.70%.
- Total de créditos: 1,000 operaciones.

Los resultados corresponden a la vista general del reporte, sin filtros aplicados.

### 5.2 Distribución geográfica

Se incorporó una gráfica de barras que muestra el saldo de cartera por región.

En la vista general, la región Centro presenta el mayor saldo, mientras que Norte registra el menor.

Esta visualización permite identificar la distribución geográfica de la exposición crediticia y orientar análisis posteriores de concentración y riesgo.

### 5.3 Distribución por sector económico

Se desarrolló una gráfica de barras para comparar el saldo de cartera por sector económico.

En la vista general, Manufactura y Tecnología presentan los mayores saldos, mientras que Comercio registra el menor.

Esta información permite identificar sectores con mayor participación en la cartera y evaluar posibles concentraciones.

### 5.4 Morosidad por tipo de crédito

Se incorporó una gráfica que compara el índice de morosidad por producto crediticio.

En la vista general, Arrendamiento presenta el índice más alto, seguido por Línea revolvente, Capital de trabajo y Crédito simple.

Esta visualización ayuda a identificar productos que requieren una revisión más detallada de su comportamiento crediticio.

### 5.5 Filtros interactivos

Se implementaron segmentadores por:

- Región.
- Sector económico.

Estos filtros permiten analizar los indicadores y visualizaciones bajo diferentes segmentos de la cartera.

### 5.6 Interpretación ejecutiva

El dashboard permite identificar tres áreas de atención:

1. **Riesgo crediticio:** el índice de morosidad de 25.70% requiere investigar las características de los créditos vencidos y sus posibles concentraciones.
2. **Concentración de cartera:** la distribución por región y sector permite localizar segmentos con mayor exposición.
3. **Seguimiento comercial y financiero:** la comparación entre montos originales, saldos y pagos ofrece una visión general del comportamiento de la cartera.

Los hallazgos son descriptivos y no permiten establecer por sí solos las causas de la morosidad ni determinar la rentabilidad de cada producto.

### 5.7 Recomendaciones

- Profundizar en el análisis de créditos vencidos por antigüedad de atraso.
- Evaluar la concentración de cartera por cliente, región y sector.
- Incorporar comparativos temporales para identificar tendencias de recuperación y morosidad.
- Complementar el dashboard con indicadores de rentabilidad y costo de fondeo en una futura versión.

**Nota:** Los datos utilizados son simulados. Las recomendaciones tienen fines académicos y no representan decisiones sobre una cartera real.



## 6. Competencias desarrolladas

Durante la Unidad 6 se trabajaron las siguientes competencias:

### Modelado de datos
- Importación de archivos CSV a Power BI.
- Identificación de llaves primarias y foráneas.
- Construcción de relaciones entre clientes, créditos y pagos.
- Comprensión de la cardinalidad entre tablas.

### Lenguaje DAX
- Creación de medidas mediante SUM y DISTINCTCOUNT.
- Uso de CALCULATE para aplicar condiciones de filtrado.
- Uso de DIVIDE para calcular indicadores porcentuales.
- Aplicación del contexto de filtros a indicadores financieros.

### Visualización y análisis
- Construcción de tarjetas KPI.
- Elaboración de gráficas comparativas.
- Implementación de segmentadores interactivos.
- Análisis de concentración geográfica y sectorial.
- Interpretación de indicadores de cartera vencida y morosidad.

### Enfoque de negocio
- Traducción de información operativa a indicadores ejecutivos.
- Identificación de riesgos y áreas de atención.
- Formulación de recomendaciones a partir de datos.
- Reconocimiento de las limitaciones del análisis.

## 7. Limitaciones y oportunidades de mejora

El proyecto representa una primera versión funcional del dashboard.

Entre las principales oportunidades de mejora se identificaron:

1. Incorporar una tabla calendario para análisis temporales.
2. Evaluar la evolución mensual de saldos, pagos y morosidad.
3. Incorporar indicadores de recuperación y antigüedad de cartera vencida.
4. Analizar concentración por cliente y acreditado.
5. Integrar métricas de rentabilidad, tasas y costo de fondeo.
6. Validar los criterios utilizados para clasificar la cartera vencida.

Estas mejoras corresponden a desarrollos futuros y no forman parte de las funcionalidades implementadas en esta versión.

## 8. Evidencia del proyecto

El repositorio contiene los siguientes archivos:

- `Dashboard_Cartera_PyME.pbix`: dashboard desarrollado en Power BI.
- `datos/clientes.csv`: base simulada de clientes.
- `datos/creditos.csv`: base simulada de operaciones crediticias.
- `datos/pagos.csv`: base simulada de movimientos de pago.
- `datos/LEEME.txt`: descripción de los archivos y sus relaciones.
- `README.md`: documentación técnica y ejecutiva del proyecto.

## 9. Evaluación y revisión del mentor

**Unidad:** 6 — Power BI

**Proyecto:** Dashboard Ejecutivo de Cartera de Crédito PyME

**Estado:** Desarrollo práctico terminado; documentación preparada para revisión.

**Mentor:** Francisco Delgadillo

### Aspectos para revisión

- Estructura y relaciones del modelo de datos.
- Correcta implementación de las medidas DAX.
- Interpretación financiera de los indicadores.
- Diseño y utilidad del dashboard ejecutivo.
- Recomendaciones para mejorar el proyecto.

### Pendiente

Revisión y retroalimentación del mentor para validar el dominio de las competencias y definir posibles ajustes.

---

**Conclusión personal**

La Unidad 6 permitió integrar conocimientos de análisis de datos y experiencia financiera mediante la construcción de un dashboard de cartera PyME.

El proyecto demuestra la aplicación de Power BI para organizar información, construir indicadores y comunicar resultados relevantes para la toma de decisiones.

La siguiente etapa consiste en fortalecer la interpretación ejecutiva de los datos y convertir los hallazgos en recomendaciones de negocio.


