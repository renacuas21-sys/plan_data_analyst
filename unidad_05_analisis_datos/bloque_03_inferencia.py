
import math

# Datos hipotéticos de una muestra aleatoria de créditos
media_muestral = 22
desviacion_muestral = 30
tamano_muestra = 900

# Error estándar del promedio
error_estandar = desviacion_muestral / math.sqrt(tamano_muestra)

print("Error estándar:", error_estandar)

valor_critico = 1.96
margen_error = valor_critico * error_estandar

print("Margen de error:", margen_error)

limite_inferior = media_muestral - margen_error
limite_superior = media_muestral + margen_error

print("Intervalo de confianza del 95%:", limite_inferior, limite_superior)

# Prueba de hipótesis: promedio de atraso superior a 15 días

limite_politica = 20

estadistico_z = (media_muestral - limite_politica) / error_estandar

print("Estadístico Z:", estadistico_z)

# Calcular valor p para una prueba unilateral
valor_p = 0.5 * math.erfc(estadistico_z / math.sqrt(2))

print("Valor p:", valor_p)



# Decisión estadística automática
nivel_significancia = 0.05

if valor_p <= nivel_significancia:
    print("Decisión: Rechazamos H0")
    print(f"Existe evidencia de que el promedio supera los {limite_politica} días.")
else:
    print("Decisión: No rechazamos H0")
    print(f"No existe evidencia suficiente de que el promedio supere los {limite_politica} días.")


