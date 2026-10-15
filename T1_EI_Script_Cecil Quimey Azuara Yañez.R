# Datos del experimento
R <- 100      # Resistencia
V <- 10       # Voltaje

I <- V / R  # Fórmula de la Corriente

I # Corriente

n <- 100  # Número de mediciones/intentos

# Simular las mediciones con (0.002)
error <- rnorm(n, 0, 0.002)

# Fórmula: Corriente medida = corriente teórica + error
mediciones <- I + error

# Gráfica (mediciones/intentos)
plot(1:n, mediciones, type = "o", pch = 16, xlab = "Medición/Intento",
  ylab = "Corriente (A)", main = "Mediciones/intentos simulados")

abline(h = I, lty = 2) # Valor teórico (Gráfica)

# Calcular promedio acumulativo
prom_acumulativo <- cumsum(mediciones) / (1:n)

# Gráfica del promedio acumulativo
plot(1:n, prom_acumulativo, type = "l", lwd = 2, xlab = "Mediciones/Intentos",
  ylab = "Corriente promedio (A)", main = "Promedio acumulativo de las mediciones/intentos")

abline(h = I, lty = 2) # Línea horizontal (valor teórico)

# Simulación usando I = 0.02
I_mod <- 0.02
medicion_modificada <- rnorm(n, mean = I_mod, sd = 0.002)

# Promedio acumulativo (nuevo)
prom_modificado <- cumsum(medicion_modificada) / (1:n)

# Gráfica del promedio acumulativo modificado y valor teórico real
plot(1:n, prom_modificado, type = "l", col = "blue", lwd = 2, 
     ylim = c(0, 0.12), xlab = "Mediciones/Intentos",
     ylab = "Corriente promedio (A)", main = "Modelo con modificación (Media = 0.02 A)")

# Línea (valor teórico real)
abline(h = I, col = "red", lty = 2, lwd = 2)