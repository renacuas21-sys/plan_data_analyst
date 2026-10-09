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

  