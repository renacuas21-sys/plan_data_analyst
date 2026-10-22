# Unidad 2 — Bloque 4
## Registro de calidad de datos

Fuente: ventas_original_bloque_04.xlsx

Objetivo:
Identificar y documentar problemas de calidad antes
de realizar transformaciones con Power Query.

## Incidencia 001 — Posible duplicidad

ID de venta: 1008

Problema detectado:
Existen dos registros con el mismo identificador de venta
y los mismos datos.

Impacto potencial:
Duplicación de operaciones e importes en los reportes.

Acción recomendada:
Validar con el área responsable si ambos registros
corresponden a operaciones legítimas.

Estado: Pendiente de validación.

Decisión:
No eliminar ni modificar registros sin autorización.

## Incidencia 002 — Cantidad de unidades faltante

ID de venta: 1007
Cliente: Elena
Producto: Teclado
Precio unitario: $800

Problema detectado:
El campo unidades está vacío.

Impacto potencial:
No es posible calcular el importe total de la venta
con información confiable.

Acción recomendada:
Solicitar al área responsable la cantidad real de unidades.

Estado: Pendiente de validación.

Regla de transformación:
Conservar el valor nulo.
No reemplazar automáticamente por 0 o 1.
No calcular un importe definitivo sin validación.

## Incidencia 003 — Cliente no identificado

ID de venta: 1005
Producto: Laptop
Importe registrado: $15,000
Estado: Completada

Problema detectado:
El campo cliente está vacío.

Impacto potencial:
El importe podría excluirse incorrectamente de los
indicadores generales o atribuirse a otro cliente.

Acción recomendada:
Solicitar la identificación del cliente al área responsable.

Estado: Pendiente de validación.

Regla de transformación:
Conservar el cliente como dato faltante.
No inventar ni asignar un cliente.
Mantener la operación identificada en los reportes
generales, señalando que requiere validación.
Excluirla de indicadores que exijan clientes verificados,
informando el importe excluido.

## Incidencia 004 — Fecha inválida

ID de venta: 1009
Valor original: fecha incorrecta

Problema detectado:
El campo fecha contiene un texto que no representa
una fecha válida.

Impacto potencial:
La operación no puede asignarse correctamente
a un día, mes o periodo de análisis.

Acción recomendada:
Solicitar la fecha correcta al área responsable.

Estado: Pendiente de validación.

Regla de transformación:
Conservar el valor original.
No inventar una fecha.
Identificar el error de conversión en Power Query.
Mantener la operación en el registro de incidencias.

## Regla de transformación 001 — Estandarización de fechas

Objetivo:
Convertir las fechas válidas a un tipo de dato Fecha.

Criterios:
- Interpretar DD/MM/AAAA como día/mes/año.
- Interpretar AAAA-MM-DD como año-mes-día.
- Conservar el valor original para auditoría.
- No asignar fechas inventadas.
- Registrar las fechas inválidas como pendientes de validación.

Validación:
Comprobar que cada fecha corresponda al día,
mes y año correctos antes de generar indicadores.

## Regla de transformación 002 — Estandarización de productos

Problema detectado:
El producto Mouse aparece registrado como Mouse y mouse.

Objetivo:
Unificar nombres equivalentes para evitar
categorías duplicadas en los reportes.

Regla de transformación:
- Conservar el valor original.
- Crear una versión estandarizada del producto.
- Convertir mouse a Mouse cuando se confirme
  que ambos representan el mismo producto.
- No modificar directamente la fuente original.

Validación:
Comparar los productos estandarizados contra
el catálogo oficial, si está disponible.

## Resultados del control de calidad — Bloque 4

Herramienta: LibreOffice Calc
Archivo: ventas_control_calidad_bloque_04.xlsx

### Indicadores

- Total de registros analizados: 10
- Registros que requieren revisión: 5
- Registros sin incidencias detectadas: 5
- Porcentaje de registros que requieren revisión: 50 %

### Validaciones implementadas

- Detección de clientes faltantes.
- Detección de unidades faltantes.
- Identificación de IDs repetidos.
- Identificación de fechas no reconocidas.
- Estandarización de nombres de productos.
- Generación de fechas estandarizadas.

### Hallazgos

- Venta 1005: cliente faltante.
- Venta 1007: unidades faltantes.
- Venta 1008: identificador repetido en dos registros.
- Venta 1009: fecha no reconocida.

### Decisiones

- Se conserva intacta la base original.
- No se eliminan registros sin validación.
- No se inventan valores para completar campos vacíos.
- Los registros señalados permanecen pendientes de revisión.
- La estandarización se realiza en una copia de trabajo.

### Pendiente

Reproducir y comprobar las transformaciones en Power Query,
incluyendo la actualización de datos.

