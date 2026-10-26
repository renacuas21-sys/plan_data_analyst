# Diccionario práctico de SQL — Plan Data Analyst

**Motor de referencia:** PostgreSQL.  
**Objetivo:** consultar rápidamente la sintaxis, entender cuándo usar cada instrucción y practicar con ejemplos bancarios.

> Los nombres de tablas y columnas de los ejemplos son ilustrativos. Adáptalos a tu base de datos antes de ejecutar las consultas.

## 1. Consultas básicas

| Comando | ¿Para qué sirve? | Ejemplo |
|---|---|---|
| `SELECT` | Elegir columnas o expresiones que se mostrarán. | `SELECT cliente_id, monto` |
| `FROM` | Indicar la tabla de origen. | `FROM movimientos` |
| `WHERE` | Filtrar filas antes de agrupar. | `WHERE monto > 10000` |
| `AND` | Exigir que se cumplan dos condiciones. | `WHERE monto > 10000 AND estado = 'Aprobado'` |
| `OR` | Aceptar una u otra condición. | `WHERE region = 'Norte' OR region = 'Sur'` |
| `NOT` | Negar una condición. | `WHERE NOT estado = 'Cancelado'` |
| `!=` o `<>` | Indicar «distinto de». | `WHERE vendedor != 'Elena'` |
| `=`, `>`, `<`, `>=`, `<=` | Comparar valores. | `WHERE monto >= 5000` |
| `AS` | Asignar un alias a una columna o tabla. | `SUM(monto) AS total` |
| `ORDER BY` | Ordenar resultados. | `ORDER BY monto DESC` |
| `ASC` / `DESC` | Orden ascendente / descendente. | `ORDER BY fecha ASC` |
| `DISTINCT` | Eliminar duplicados del resultado seleccionado. | `SELECT DISTINCT cliente_id FROM movimientos` |
| `LIMIT` | Limitar el número de filas devueltas. | `LIMIT 10` |

**Ejemplo:**
```sql
SELECT cliente_id, monto
FROM movimientos
WHERE monto >= 10000
ORDER BY monto DESC
LIMIT 5;
```

## 2. Funciones de agregación y agrupación

| Comando o función | ¿Para qué sirve? | Ejemplo |
|---|---|---|
| `COUNT(*)` | Contar filas, incluidos registros con valores nulos. | `COUNT(*) AS operaciones` |
| `COUNT(columna)` | Contar valores no nulos de una columna. | `COUNT(monto)` |
| `SUM()` | Sumar valores. | `SUM(monto) AS total_operado` |
| `AVG()` | Calcular promedio de valores no nulos. | `AVG(monto) AS ticket_promedio` |
| `MIN()` | Obtener el valor mínimo. | `MIN(monto)` |
| `MAX()` | Obtener el valor máximo. | `MAX(monto)` |
| `GROUP BY` | Agrupar filas para calcular agregados por categoría. | `GROUP BY cliente_id` |
| `HAVING` | Filtrar grupos después de agregar. | `HAVING SUM(monto) > 50000` |

**Ejemplo:**
```sql
SELECT
    cliente_id,
    COUNT(*) AS numero_operaciones,
    SUM(monto) AS monto_total,
    AVG(monto) AS ticket_promedio
FROM movimientos
GROUP BY cliente_id
HAVING COUNT(*) >= 2
ORDER BY monto_total DESC;
```

**Diferencia esencial:** `WHERE` filtra filas; `HAVING` filtra grupos ya calculados.

## 3. Relacionar tablas

| Comando | ¿Para qué sirve? |
|---|---|
| `JOIN` / `INNER JOIN` | Conservar coincidencias entre ambas tablas. |
| `LEFT JOIN` | Conservar todas las filas de la tabla izquierda y las coincidencias de la derecha. |
| `ON` | Establecer la condición que relaciona las tablas. |

**Ejemplo:**
```sql
SELECT c.cliente_id, c.nombre, m.monto
FROM clientes AS c
INNER JOIN movimientos AS m
    ON c.cliente_id = m.cliente_id;
```

> `JOIN` es un tema para reforzar con práctica si aún no lo dominas.

## 4. Consultas con CTE (`WITH`)

| Comando | ¿Para qué sirve? |
|---|---|
| `WITH` | Definir resultados intermedios con nombre para organizar una consulta compleja. |
| `AS (...)` | Encerrar la consulta que define cada CTE. |
| `WITH nombre1 AS (...), nombre2 AS (...)` | Encadenar varias CTE; las siguientes pueden usar resultados de las anteriores. |

**Ejemplo:**
```sql
WITH totales AS (
    SELECT cliente_id, SUM(monto) AS total
    FROM movimientos
    GROUP BY cliente_id
),
clientes_relevantes AS (
    SELECT cliente_id, total
    FROM totales
    WHERE total > 50000
)
SELECT *
FROM clientes_relevantes
ORDER BY total DESC;
```

## 5. Funciones de ventana

| Elemento | ¿Para qué sirve? |
|---|---|
| `OVER (...)` | Calcular una función sobre una ventana de filas sin colapsarlas en un único registro por grupo. |
| `PARTITION BY` | Separar las filas en grupos independientes dentro de la ventana. |
| `ORDER BY` dentro de `OVER` | Definir el orden para cálculos acumulados y funciones como `LAG`. |
| `ROWS BETWEEN ... AND ...` | Precisar qué filas integran el marco de cálculo. |
| `UNBOUNDED PRECEDING` | Comenzar desde la primera fila de la partición. |
| `n PRECEDING` | Incluir hasta `n` filas anteriores, según el marco. |
| `CURRENT ROW` | Referirse a la fila actual. |
| `SUM() OVER (...)` | Calcular total por cliente o suma acumulada/móvil. |
| `AVG() OVER (...)` | Calcular promedio por cliente o promedio móvil. |
| `LAG(columna, n)` | Recuperar el valor de `n` filas anteriores (1 si se omite `n`). |

**Total por cliente, sin perder el detalle de operaciones:**
```sql
SELECT
    cliente_id,
    movimiento_id,
    monto,
    SUM(monto) OVER (
        PARTITION BY cliente_id
    ) AS total_cliente
FROM movimientos;
```

**Acumulado progresivo:**
```sql
SELECT
    cliente_id,
    movimiento_id,
    monto,
    SUM(monto) OVER (
        PARTITION BY cliente_id
        ORDER BY movimiento_id
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS acumulado
FROM movimientos;
```

**Suma de la fila actual y las dos anteriores (hasta 3 operaciones):**
```sql
SELECT
    cliente_id,
    movimiento_id,
    monto,
    SUM(monto) OVER (
        PARTITION BY cliente_id
        ORDER BY movimiento_id
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS suma_ultimas_3
FROM movimientos;
```

**Promedio móvil de hasta 3 operaciones:**
```sql
SELECT
    cliente_id,
    movimiento_id,
    monto,
    AVG(monto) OVER (
        PARTITION BY cliente_id
        ORDER BY movimiento_id
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS promedio_ultimas_3
FROM movimientos;
```

**Diferencia contra la operación anterior:**
```sql
SELECT
    cliente_id,
    movimiento_id,
    monto,
    monto - LAG(monto) OVER (
        PARTITION BY cliente_id
        ORDER BY movimiento_id
    ) AS diferencia_pesos
FROM movimientos;
```

**Puntos importantes:**
- `ROWS BETWEEN 2 PRECEDING AND CURRENT ROW` puede incluir **tres** filas: dos anteriores más la actual.
- `LAG(monto, 2)` **no suma**; devuelve el valor de dos posiciones atrás.
- La primera fila de cada cliente devuelve `NULL` con `LAG(monto)` porque no existe una anterior.
- Para resultados reproducibles, el orden de la ventana debe ser inequívoco. Si `movimiento_id` no define el orden cronológico o contiene empates, agrega `fecha` y/o un identificador único al `ORDER BY`.

## 6. Por practicar y añadir tras la evaluación

- Variación porcentual usando `LAG()` y `NULLIF()` para evitar división entre cero.
- `CASE WHEN` para clasificar resultados.
- `COALESCE()` para tratar valores nulos cuando sea adecuado.
- Ejercicios integradores y resultados verificados en PostgreSQL.

## 7. Mini-guía de decisiones

| Necesito... | Uso... |
|---|---|
| Ver registros que cumplan una condición | `WHERE` |
| Contar operaciones por cliente | `COUNT(*)` + `GROUP BY` |
| Sumar montos por cliente | `SUM()` + `GROUP BY` |
| Filtrar clientes por total acumulado | `GROUP BY` + `HAVING` |
| Mostrar cada operación y el total de su cliente | `SUM() OVER (PARTITION BY ...)` |
| Calcular acumulado operación a operación | `SUM() OVER (... ORDER BY ... ROWS ...)` |
| Obtener el monto de la operación previa | `LAG(monto)` |
| Comparar monto actual con el anterior | `monto - LAG(monto) OVER (...)` |
| Organizar un análisis en etapas | `WITH` (CTE) |

## 8. Mantenimiento del diccionario

Al terminar cada bloque:
1. Agregar las funciones nuevas con definición y ejemplo.
2. Anotar errores frecuentes detectados en la práctica.
3. Probar los ejemplos relevantes en PostgreSQL.
4. Registrar los cambios en Git y subirlos a GitHub.

**Estado:** guía de estudio elaborada a partir de lo practicado; los ejemplos aún no se han verificado contra una base PostgreSQL real del proyecto.


---

# Anexo práctico — 25 consultas progresivas (Unidades 2 y 3)

**Cómo usarlo:** ejecuta primero los datos de prueba en PostgreSQL, en una base de práctica. Después ejecuta cada consulta por separado. Las tablas y resultados son **simulados**, no datos reales del proyecto. Los resultados se calcularon sobre el conjunto de prueba y **aún no han sido validados en tu PostgreSQL**.

## A. Datos de prueba reproducibles

> Importante: las sentencias siguientes eliminan y recrean las tablas de práctica `movimientos_practica` y `clientes_practica` si existen. Úsalas solamente en una base de ejercicios, nunca en tablas reales.

```sql
DROP TABLE IF EXISTS movimientos_practica;
DROP TABLE IF EXISTS clientes_practica;

CREATE TABLE clientes_practica (
    cliente_id INTEGER PRIMARY KEY,
    nombre TEXT NOT NULL,
    region TEXT NOT NULL
);

CREATE TABLE movimientos_practica (
    movimiento_id INTEGER PRIMARY KEY,
    cliente_id INTEGER NOT NULL REFERENCES clientes_practica(cliente_id),
    fecha DATE NOT NULL,
    monto NUMERIC(12,2) NOT NULL,
    estado TEXT NOT NULL
);

INSERT INTO clientes_practica (cliente_id, nombre, region) VALUES
(1, 'Ana', 'Norte'),
(2, 'Luis', 'Centro'),
(3, 'Elena', 'Sur'),
(4, 'Marta', 'Norte');

INSERT INTO movimientos_practica (movimiento_id, cliente_id, fecha, monto, estado) VALUES
(301, 1, '2026-10-01', 20000, 'Aprobado'),
(302, 1, '2026-10-02', 30000, 'Aprobado'),
(303, 1, '2026-10-03', 24000, 'Aprobado'),
(304, 2, '2026-10-01', 10000, 'Aprobado'),
(305, 2, '2026-10-02', 15000, 'Aprobado'),
(306, 2, '2026-10-03', 5000, 'Cancelado'),
(307, 3, '2026-10-01', 40000, 'Aprobado'),
(308, 3, '2026-10-02', 20000, 'Aprobado');
```

**Mapa para verificar resultados:** Ana: 3 operaciones, $74,000; Luis: 3 operaciones, $30,000 (incluida una cancelada); Elena: 2 operaciones, $60,000; Marta: 0 operaciones. Los totales sin filtro incluyen todos los estados; para contar únicamente aprobadas, hay que filtrar `estado = 'Aprobado'`.

## B. Unidad 2 — consultas básicas, agregación y relaciones

### 01. Ver todas las operaciones
**Pregunta:** ¿Qué movimientos hay registrados?  
**Uso:** inspección inicial. **Resultado:** 8 filas con todas las columnas.
```sql
SELECT * FROM movimientos_practica ORDER BY movimiento_id;
```

### 02. Seleccionar columnas específicas
**Pregunta:** ¿Qué cliente y monto tiene cada movimiento?  
**Uso:** mostrar únicamente información relevante. **Resultado:** 8 filas, 3 columnas.
```sql
SELECT movimiento_id, cliente_id, monto
FROM movimientos_practica
ORDER BY movimiento_id;
```

### 03. Filtrar montos altos
**Pregunta:** ¿Qué movimientos son de $20,000 o más?  
**Uso:** localizar operaciones de importe elevado. **Resultado:** 5 movimientos: 301, 302, 303, 307, 308.
```sql
SELECT movimiento_id, monto
FROM movimientos_practica
WHERE monto >= 20000
ORDER BY movimiento_id;
```

### 04. Combinar condiciones con AND
**Pregunta:** ¿Qué operaciones aprobadas superan $20,000?  
**Uso:** análisis de operaciones relevantes. **Resultado:** 3 movimientos: 302, 303, 307.
```sql
SELECT movimiento_id, cliente_id, monto
FROM movimientos_practica
WHERE estado = 'Aprobado' AND monto > 20000
ORDER BY movimiento_id;
```

### 05. Usar OR
**Pregunta:** ¿Qué operaciones son del cliente 1 o del cliente 3?  
**Uso:** comparar carteras seleccionadas. **Resultado:** 5 movimientos.
```sql
SELECT movimiento_id, cliente_id, monto
FROM movimientos_practica
WHERE cliente_id = 1 OR cliente_id = 3
ORDER BY movimiento_id;
```

### 06. Ordenar y limitar resultados
**Pregunta:** ¿Cuáles son las tres operaciones más grandes?  
**Uso:** identificar importes destacados. **Resultado:** 307 ($40,000), 302 ($30,000), 303 ($24,000).
```sql
SELECT movimiento_id, monto
FROM movimientos_practica
ORDER BY monto DESC, movimiento_id
LIMIT 3;
```

### 07. Contar operaciones
**Pregunta:** ¿Cuántos movimientos hay?  
**Uso:** medir volumen de registros. **Resultado:** 8.
```sql
SELECT COUNT(*) AS operaciones
FROM movimientos_practica;
```

### 08. Sumar montos
**Pregunta:** ¿Cuánto suman todos los movimientos registrados?  
**Uso:** medir monto bruto registrado, incluyendo cancelados. **Resultado:** $164,000.
```sql
SELECT SUM(monto) AS monto_registrado
FROM movimientos_practica;
```

### 09. Promedio por operación
**Pregunta:** ¿Cuál es el ticket promedio registrado?  
**Uso:** medir importe medio por registro. **Resultado:** $20,500.
```sql
SELECT AVG(monto) AS ticket_promedio
FROM movimientos_practica;
```

### 10. Agrupar por cliente
**Pregunta:** ¿Cuántas operaciones y cuánto monto tiene cada cliente activo?  
**Uso:** resumir comportamiento por cliente. **Resultado:** Ana 3/$74,000; Luis 3/$30,000; Elena 2/$60,000.
```sql
SELECT cliente_id,
       COUNT(*) AS operaciones,
       SUM(monto) AS total,
       AVG(monto) AS promedio
FROM movimientos_practica
GROUP BY cliente_id
ORDER BY cliente_id;
```

### 11. Filtrar grupos con HAVING
**Pregunta:** ¿Qué clientes acumulan más de $50,000?  
**Uso:** identificar clientes de alto volumen. **Resultado:** clientes 1 ($74,000) y 3 ($60,000).
```sql
SELECT cliente_id, SUM(monto) AS total
FROM movimientos_practica
GROUP BY cliente_id
HAVING SUM(monto) > 50000
ORDER BY total DESC;
```

### 12. Diferenciar WHERE de HAVING
**Pregunta:** ¿Qué clientes acumulan más de $50,000 solo en operaciones aprobadas?  
**Uso:** excluir cancelaciones *antes* de agregar. **Resultado:** clientes 1 y 3.
```sql
SELECT cliente_id, SUM(monto) AS total_aprobado
FROM movimientos_practica
WHERE estado = 'Aprobado'
GROUP BY cliente_id
HAVING SUM(monto) > 50000
ORDER BY total_aprobado DESC;
```

### 13. INNER JOIN: mostrar nombres
**Pregunta:** ¿Quién realizó cada operación?  
**Uso:** unir transacciones con datos de clientes. **Resultado:** 8 filas; Ana 3, Luis 3, Elena 2.
```sql
SELECT c.nombre, m.movimiento_id, m.monto
FROM clientes_practica AS c
INNER JOIN movimientos_practica AS m
    ON c.cliente_id = m.cliente_id
ORDER BY m.movimiento_id;
```

### 14. LEFT JOIN: incluir clientes sin operaciones
**Pregunta:** ¿Cuántos movimientos tiene cada cliente, incluida Marta?  
**Uso:** no perder clientes sin actividad. **Resultado:** Ana 3, Luis 3, Elena 2, Marta 0. `COUNT(m.movimiento_id)` evita contar la fila vacía del LEFT JOIN.
```sql
SELECT c.nombre, COUNT(m.movimiento_id) AS operaciones
FROM clientes_practica AS c
LEFT JOIN movimientos_practica AS m
    ON c.cliente_id = m.cliente_id
GROUP BY c.cliente_id, c.nombre
ORDER BY c.cliente_id;
```

### 15. Resumen por región
**Pregunta:** ¿Qué monto se registra en cada región?  
**Uso:** comparar segmentos territoriales. **Resultado:** Norte $74,000; Centro $30,000; Sur $60,000.
```sql
SELECT c.region, SUM(m.monto) AS total
FROM clientes_practica AS c
INNER JOIN movimientos_practica AS m
    ON c.cliente_id = m.cliente_id
GROUP BY c.region
ORDER BY total DESC;
```

## C. Unidad 3 — CTE y funciones de ventana

### 16. CTE sencilla
**Pregunta:** ¿Qué clientes acumulan más de $50,000?  
**Uso:** separar el cálculo de la selección final. **Resultado:** clientes 1 y 3.
```sql
WITH totales AS (
    SELECT cliente_id, SUM(monto) AS total
    FROM movimientos_practica
    GROUP BY cliente_id
)
SELECT cliente_id, total
FROM totales
WHERE total > 50000
ORDER BY total DESC;
```

### 17. Dos CTE encadenadas
**Pregunta:** ¿Qué clientes superan el umbral y cómo los clasificamos?  
**Uso:** dividir el análisis en etapas. **Resultado:** Ana y Elena, ambas 'Alto volumen'.
```sql
WITH totales AS (
    SELECT cliente_id, SUM(monto) AS total
    FROM movimientos_practica
    GROUP BY cliente_id
),
clasificados AS (
    SELECT cliente_id, total,
           CASE WHEN total > 50000 THEN 'Alto volumen'
                ELSE 'Volumen regular' END AS segmento
    FROM totales
)
SELECT c.nombre, x.total, x.segmento
FROM clasificados AS x
JOIN clientes_practica AS c ON c.cliente_id = x.cliente_id
WHERE x.segmento = 'Alto volumen'
ORDER BY x.total DESC;
```

### 18. SUM OVER por cliente
**Pregunta:** ¿Cuál es el total del cliente sin ocultar sus movimientos?  
**Uso:** comparar cada operación con el total de su cliente. **Resultado:** 8 filas; las 3 de Ana muestran total_cliente = $74,000.
```sql
SELECT cliente_id, movimiento_id, monto,
       SUM(monto) OVER (PARTITION BY cliente_id) AS total_cliente
FROM movimientos_practica
ORDER BY cliente_id, movimiento_id;
```

### 19. AVG OVER por cliente
**Pregunta:** ¿Cuál es el ticket promedio de cada cliente sin agrupar filas?  
**Uso:** comparar transacciones individuales con su promedio. **Resultado:** Ana $24,666.67 aprox.; Luis $10,000; Elena $30,000.
```sql
SELECT cliente_id, movimiento_id, monto,
       ROUND(AVG(monto) OVER (PARTITION BY cliente_id), 2) AS promedio_cliente
FROM movimientos_practica
ORDER BY cliente_id, movimiento_id;
```

### 20. Acumulado progresivo
**Pregunta:** ¿Cómo crece el monto de cada cliente operación a operación?  
**Uso:** analizar evolución. **Resultado:** Ana: $20,000 → $50,000 → $74,000; Luis: $10,000 → $25,000 → $30,000; Elena: $40,000 → $60,000.
```sql
SELECT cliente_id, movimiento_id, monto,
       SUM(monto) OVER (
           PARTITION BY cliente_id
           ORDER BY movimiento_id
           ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
       ) AS acumulado
FROM movimientos_practica
ORDER BY cliente_id, movimiento_id;
```

### 21. Suma móvil de hasta tres operaciones
**Pregunta:** ¿Cuánto suman la operación actual y hasta dos anteriores?  
**Uso:** medir actividad reciente. **Resultado:** Ana en M303 = $74,000; Luis en M306 = $30,000.
```sql
SELECT cliente_id, movimiento_id, monto,
       SUM(monto) OVER (
           PARTITION BY cliente_id
           ORDER BY movimiento_id
           ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
       ) AS suma_ultimas_3
FROM movimientos_practica
ORDER BY cliente_id, movimiento_id;
```

### 22. Promedio móvil de hasta tres operaciones
**Pregunta:** ¿Cuál es el promedio reciente por cliente?  
**Uso:** detectar cambios en ticket medio. **Resultado:** Ana en M303 ≈ $24,666.67; Luis en M306 = $10,000.
```sql
SELECT cliente_id, movimiento_id, monto,
       ROUND(AVG(monto) OVER (
           PARTITION BY cliente_id
           ORDER BY movimiento_id
           ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
       ), 2) AS promedio_ultimas_3
FROM movimientos_practica
ORDER BY cliente_id, movimiento_id;
```

### 23. LAG: operación anterior
**Pregunta:** ¿Cuál fue el monto inmediatamente anterior de cada cliente?  
**Uso:** preparar comparaciones. **Resultado:** Ana M303 → $30,000; Luis M305 → $10,000; primera operación de cada cliente → NULL.
```sql
SELECT cliente_id, movimiento_id, monto,
       LAG(monto) OVER (
           PARTITION BY cliente_id
           ORDER BY movimiento_id
       ) AS monto_anterior
FROM movimientos_practica
ORDER BY cliente_id, movimiento_id;
```

### 24. Diferencia en pesos con LAG
**Pregunta:** ¿Cuánto subió o bajó el importe frente a la operación anterior?  
**Uso:** detectar variaciones absolutas. **Resultado:** Ana M302 +$10,000; M303 −$6,000; Elena M308 −$20,000.
```sql
SELECT cliente_id, movimiento_id, monto,
       monto - LAG(monto) OVER (
           PARTITION BY cliente_id
           ORDER BY movimiento_id
       ) AS diferencia_pesos
FROM movimientos_practica
ORDER BY cliente_id, movimiento_id;
```

### 25. Variación porcentual segura
**Pregunta:** ¿Qué porcentaje aumentó o disminuyó cada operación respecto a la anterior?  
**Uso:** comparar cambios relativos. **Resultado:** Ana M302 +50%; M303 −20%; Elena M308 −50%; primera operación por cliente → NULL. `NULLIF` evita dividir entre cero y `100.0` conserva precisión decimal.
```sql
WITH comparacion AS (
    SELECT cliente_id, movimiento_id, monto,
           LAG(monto) OVER (
               PARTITION BY cliente_id
               ORDER BY movimiento_id
           ) AS monto_anterior
    FROM movimientos_practica
)
SELECT cliente_id, movimiento_id, monto, monto_anterior,
       ROUND(
           (monto - monto_anterior) * 100.0
           / NULLIF(monto_anterior, 0),
           2
       ) AS variacion_porcentual
FROM comparacion
ORDER BY cliente_id, movimiento_id;
```

## D. Reglas para interpretar las consultas

- `GROUP BY` resume y reduce filas; `OVER (PARTITION BY ...)` permite conservar el detalle.
- `ROWS BETWEEN 2 PRECEDING AND CURRENT ROW` abarca **hasta 3 filas**; `LAG(monto, 2)` devuelve **un solo monto**, dos posiciones atrás.
- `LAG` en la primera operación de cada cliente devuelve `NULL` (salvo que se indique otro valor por defecto).
- En este conjunto, `movimiento_id` marca un orden inequívoco. En bases reales, verifica fecha e identificador para ordenar cronológicamente.
- Las operaciones canceladas siguen presentes salvo que uses un filtro. No interpretes la suma de todos los estados como ingreso efectivamente realizado.
- La consulta 25 es **material de referencia anticipado**: debes intentar construirla por tu cuenta antes de dar por aprobado el Bloque 2.

## E. Checklist de estudio

Para cada consulta, comprueba que puedes: **(1)** explicar la pregunta de negocio; **(2)** anticipar el resultado; **(3)** escribirla sin copiar; **(4)** ejecutarla en PostgreSQL; **(5)** interpretar la salida y detectar estados o nulos que cambien el significado.
