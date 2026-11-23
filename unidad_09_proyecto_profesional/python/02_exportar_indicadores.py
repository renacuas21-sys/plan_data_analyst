
import os
import getpass
import psycopg2
from pathlib import Path
import pandas as pd


# 1. Configuración
config = {
    "host": "localhost",
    "port": 5432,
    "dbname": "distribuidora_occidente",
    "user": "postgres",
    "password": os.getenv("PGPASSWORD") or getpass.getpass(
        "Contraseña de PostgreSQL: "
    )
}

BASE_DIR = Path(__file__).resolve().parent.parent
carpeta_salida = BASE_DIR / "data" / "processed"
carpeta_salida.mkdir(parents=True, exist_ok=True)


# 2. Función reutilizable
def ejecutar_consulta(conexion, consulta):
    with conexion.cursor() as cursor:
        cursor.execute(consulta)
        columnas = [
            columna[0] for columna in cursor.description
        ]
        registros = cursor.fetchall()

    return pd.DataFrame(registros, columns=columnas)


# 3. Consultas
ruta_sql = BASE_DIR / "sql" / "03_analisis_regional.sql"
consulta_regional = ruta_sql.read_text(encoding="utf-8")

consulta_clientes = """
SELECT COUNT(*) AS total_clientes
FROM clientes;
"""
# Consulta completa de rentabilidad por cliente
ruta_clientes = BASE_DIR / "sql" / "07_indicadores_clientes.sql"
# Consulta de rentabilidad por producto
ruta_productos = BASE_DIR / "sql" / "04_rentabilidad_productos.sql"

consulta_productos = ruta_productos.read_text(
    encoding="utf-8"
)
consulta_indicadores_clientes = ruta_clientes.read_text(
    encoding="utf-8"
)
# Consulta de rentabilidad por categorías
ruta_categorias = BASE_DIR / "sql" / "06_rentabilidad_categorias.sql"

consulta_categorias = ruta_categorias.read_text(
    encoding="utf-8"
)
ruta_referencia = BASE_DIR / "sql" / "08_referencia_financiera.sql"

consulta_referencia = ruta_referencia.read_text(
    encoding="utf-8"
)
# 4. Ejecución centralizada
try:
    with psycopg2.connect(**config) as conexion:

        print("Conexión exitosa")
        print(f"Base de datos: {config['dbname']}")

        # Indicadores regionales
        df_regional = ejecutar_consulta(
            conexion, consulta_regional
        )

        ruta_csv = carpeta_salida / "indicadores_regionales.csv"

        df_regional.to_csv(
            ruta_csv,
            index=False,
            encoding="utf-8-sig"
        )

        print("\nExtracción regional completada")
        print(df_regional.to_string(index=False))
        print(f"\nArchivo generado: {ruta_csv}")
        
      

        # Validación de clientes
        df_clientes = ejecutar_consulta(
            conexion, consulta_clientes
        )

        print("\nPrueba de función reutilizable:")
        print(df_clientes)
        # Exportar rentabilidad completa de clientes
        df_indicadores_clientes = ejecutar_consulta(
            conexion, consulta_indicadores_clientes
        )

        total_filas = len(df_indicadores_clientes)
        clientes_unicos = df_indicadores_clientes["id_cliente"].nunique()

        print(f"\nFilas obtenidas: {total_filas}")
        print(f"Clientes únicos: {clientes_unicos}")

        # Validación antes de exportar
        if total_filas != 300 or clientes_unicos != 300:
            raise ValueError(
                "Validación fallida: revisar clientes faltantes o duplicados"
            )

        ruta_csv_clientes = (
            carpeta_salida / "indicadores_clientes.csv"
        )

        df_indicadores_clientes.to_csv(
            ruta_csv_clientes,
            index=False,
            encoding="utf-8-sig"
        )

        print(f"\nArchivo generado: {ruta_csv_clientes}")

        # Validación financiera de ventas por cliente
        ventas_clientes = df_indicadores_clientes["ventas_totales"].sum()

        print(
            f"\nVentas acumuladas de clientes: "
            f"${ventas_clientes:,.2f}"
        )

        # Indicadores de productos
        df_productos = ejecutar_consulta(
            conexion, consulta_productos
        )

        total_productos = len(df_productos)
        productos_unicos = df_productos["id_producto"].nunique()

        print(f"\nProductos obtenidos: {total_productos}")
        print(f"Productos únicos: {productos_unicos}")

        # Validación de integridad
        if total_productos != 40 or productos_unicos != 40:
            raise ValueError(
                "Validación fallida: revisar productos faltantes o duplicados"
            )

        # Conciliación financiera
        ventas_productos = df_productos["ventas_totales"].sum()

        diferencia = abs(
            ventas_productos - ventas_clientes
        )

        print(f"Ventas por productos: ${ventas_productos:,.2f}")
        print(f"Diferencia contra clientes: ${diferencia:,.2f}")

        if diferencia > 0.01:
            raise ValueError(
                "Las ventas por productos no concilian con clientes"
            )

        # Exportación
        ruta_csv_productos = (
            carpeta_salida / "indicadores_productos.csv"
        )

        df_productos.to_csv(
            ruta_csv_productos,
            index=False,
            encoding="utf-8-sig"
        )

        print(f"Archivo generado: {ruta_csv_productos}")

        # Indicadores por categorías
        df_categorias = ejecutar_consulta(
            conexion, consulta_categorias
        )

        total_categorias = len(df_categorias)
        categorias_unicas = df_categorias["categoria"].nunique()
        productos_en_categorias = df_categorias["productos_distintos"].sum()

        print(f"\nCategorías obtenidas: {total_categorias}")
        print(f"Categorías únicas: {categorias_unicas}")
        print(f"Productos agrupados: {productos_en_categorias}")

        # Validación de integridad
        if (
            total_categorias != 4
            or categorias_unicas != 4
            or productos_en_categorias != 40
        ):
            raise ValueError(
                "Validación fallida: revisar categorías o productos"
            )

        # Conciliación financiera
        ventas_categorias = df_categorias["ventas_totales"].sum()
        diferencia_categorias = abs(
            ventas_categorias - ventas_productos
        )

        print(f"Ventas por categorías: ${ventas_categorias:,.2f}")
        print(
            f"Diferencia contra productos: "
            f"${diferencia_categorias:,.2f}"
        )

        if diferencia_categorias > 0.01:
            raise ValueError(
                "Las ventas por categorías no concilian con productos"
            )

        # Validación de participación
        participacion_total = (
            df_categorias["participacion_ventas_pct"].sum()
        )

        print(f"Participación total: {participacion_total:.2f}%")

        if abs(participacion_total - 100) > 0.05:
            raise ValueError(
                "La participación de ventas no suma aproximadamente 100%"
            )

        # Exportación
        ruta_csv_categorias = (
            carpeta_salida / "indicadores_categorias.csv"
        )

        df_categorias.to_csv(
            ruta_csv_categorias,
            index=False,
            encoding="utf-8-sig"
        )

        print(f"Archivo generado: {ruta_csv_categorias}")

        # Auditoría financiera conjunta
        print("\nAUDITORÍA FINANCIERA CONJUNTA")

        perspectivas = {
            "Regiones": df_regional.rename(
                columns={"costo_mercancia": "costo_total"}
            ),
            "Clientes": df_indicadores_clientes,
            "Productos": df_productos,
            "Categorías": df_categorias
        }

        df_referencia = ejecutar_consulta(
            conexion, consulta_referencia
        )

        if len(df_referencia) != 1:
            raise ValueError(
                "La referencia financiera debe devolver una fila"
            )

        referencia = {
            "ventas_totales": float(
                df_referencia["ventas_totales"].iloc[0]
            ),
            "costo_total": float(
                df_referencia["costo_total"].iloc[0]
            ),
            "utilidad_bruta": float(
                df_referencia["utilidad_bruta"].iloc[0]
            )
        }

        for nombre, df in perspectivas.items():
            print(f"\n{nombre}:")


            for indicador, valor_esperado in referencia.items():
                if indicador not in df.columns:
                    raise ValueError(
                        f"{nombre}: falta la columna {indicador}"
                    )

                valor_obtenido = float(df[indicador].sum())
                diferencia = abs(valor_obtenido - valor_esperado)

                print(
                    f"  {indicador}: ${valor_obtenido:,.2f} "
                    f"| Diferencia: ${diferencia:,.2f}"
                )

                if diferencia > 0.01:
                    raise ValueError(
                        f"{nombre}: no concilia {indicador}"
                    )

        print("\nAuditoría financiera conjunta aprobada")

except (psycopg2.Error, OSError, ValueError) as error:
    print(f"Error durante la ejecución: {error}")

    # Validación posterior a la exportación
df_verificacion = pd.read_csv(ruta_csv_clientes)

filas_exportadas = len(df_verificacion)
clientes_exportados = df_verificacion["id_cliente"].nunique()

print(f"Filas exportadas: {filas_exportadas}")
print(f"Clientes únicos exportados: {clientes_exportados}")

if filas_exportadas != 300 or clientes_exportados != 300:
    raise ValueError(
        "El CSV de clientes no conserva los 300 registros esperados"
    )

    