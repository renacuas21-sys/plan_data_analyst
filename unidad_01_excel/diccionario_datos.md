# Diccionario de datos

## Unidad 1 - Bloque 1

Proyecto: Plan para Data Analyst
Fecha: 8 de octubre de 2026

## Objetivo

Documentar el significado, tipo de dato y reglas
de interpretacion de las columnas utilizadas
en el analisis de ventas.

## Columnas del conjunto de datos

### Ticket

- Descripcion: Identificador de una transaccion de venta.
- Tipo de dato: Texto o identificador.
- Uso: Permite agrupar los productos que pertenecen
  a una misma compra y distinguir diferentes compras
  realizadas por un cliente.
- Validacion: Confirmar que el identificador permita
  distinguir correctamente cada transaccion.

  ### Cliente

- Descripcion: Identifica al cliente asociado
  a una transaccion de venta.
- Tipo de dato: Texto o identificador.
- Uso: Permite analizar las compras realizadas
  por cada cliente.
- Validacion: Preferir un ID de cliente unico
  y revisar posibles diferencias en los nombres.

  ### Producto

- Descripcion: Articulo registrado en una transaccion
  de venta.
- Tipo de dato: Texto o identificador.
- Uso: Permite analizar las unidades e ingresos
  generados por cada producto.
- Validacion: Preferir un codigo unico de producto
  y revisar diferencias en nombres o descripciones.

  ## Diccionario completo de columnas — Hoja Ventas

| Campo | Tipo de dato | Descripción |
|---|---|---|
| Ticket | Texto / identificador | Identifica el ticket de venta. Puede repetirse en distintas líneas. |
| Linea | Entero | Número de línea dentro del ticket. |
| Fecha | Fecha | Fecha de la operación registrada. |
| Cliente_ID | Texto / identificador | Código que identifica al cliente. |
| Producto_ID | Texto / identificador | Código que identifica al producto. |
| Region | Texto / categoría | Región comercial asociada a la operación. |
| Canal | Texto / categoría | Canal mediante el cual se realizó la venta. |
| Vendedor | Texto | Vendedor asociado a la operación. |
| Unidades | Número entero | Cantidad de unidades registradas en la línea. |
| Precio_unitario | Número decimal / moneda | Precio por unidad antes de aplicar el descuento registrado. |
| Descuento_pct | Número decimal / porcentaje | Porcentaje de descuento aplicado a la línea. |
| Costo_unitario | Número decimal / moneda | Costo registrado por unidad del producto. |
| Estado | Texto / categoría | Situación de la operación: Completada, Cancelada o Devuelta. |
| Metodo_pago | Texto / categoría | Método de pago registrado. |
| Ingreso_neto | Número decimal / moneda | Importe de la línea después del descuento. |
| Costo_total | Número decimal / moneda | Costo total correspondiente a las unidades de la línea. |
| Utilidad_bruta | Número decimal / moneda | Diferencia entre ingreso neto y costo total. |
| Observacion | Texto | Comentarios o incidencias relacionados con el registro. |

### Reglas básicas de validación

- Verificar que la combinación de `Ticket` y `Linea` identifique correctamente cada renglón.
- Confirmar que `Fecha` contenga fechas válidas.
- Revisar que `Cliente_ID` y `Producto_ID` correspondan a los catálogos disponibles.
- Investigar unidades iguales a cero o valores inesperados, sin eliminar registros automáticamente.
- Revisar precios, costos y descuentos faltantes o fuera de los rangos esperados.
- Comprobar las fórmulas de `Ingreso_neto`, `Costo_total` y `Utilidad_bruta`.
- Distinguir los registros completados, cancelados y devueltos antes de calcular indicadores comerciales.
- Documentar las incidencias y conservar los datos originales hasta su validación.

### Fórmulas de referencia

**Ingreso neto:** Unidades × Precio unitario × (1 − Descuento).

**Costo total:** Unidades × Costo unitario.

**Utilidad bruta:** Ingreso neto − Costo total.

Estas fórmulas se aplican cuando los datos necesarios están disponibles y son válidos. Los valores faltantes deben identificarse y tratarse según las reglas de calidad del proyecto.