# ==============================================================
# Capítulo 7 - Validación de la Hipótesis de Normalidad
# Inferencia Estadística, EST-11102, ITAM
# ==============================================================

# --------------------------------------------------------------
# 1. Gráfico de probabilidad normal (QQ-plot): Fondo X vs.
#    reclamaciones de seguros (Ejemplos 7.1.1 y 7.2.1;
#    reproduce la Figura 7.2.1)
# --------------------------------------------------------------

fondo <- c(1.57, 1.56, 0.77, -2.21, 3.13, 0.02, 2.81, 0.32,
           -0.75, 0.38, -0.83, 0.09)

reclamos <- c(7, 7.9, 7.3, 9, 9.1, 19.4, 18.7, 14.1, 9.1, 5.3, 5.6, 7,
              12.6, 32.1, 8.8, 9.7, 17.8, 7.1, 7.8, 9, 2.8, 16.6, 5.4,
              5.8, 15.3, 9.5, 7.5, 5.9, 13.7, 5.3, 5.8, 24.4, 8.7, 22.5,
              9.2, 14.9, 15.8, 7.6, 6.1, 13.6, 9.4, 10.7, 23.6, 25.2, 3.8)

# Posiciones de graficación p_i = (i-0.5)/n y cuantiles teóricos,
# construidos "a mano" como en la Tabla 7.1.1 (aquí para el Fondo X)
n_fondo <- length(fondo)
p_i     <- (seq_len(n_fondo) - 0.5) / n_fondo
z_i     <- qnorm(p_i)
tabla_fondo <- data.frame(
  i = seq_len(n_fondo), x_ord = sort(fondo), p_i = round(p_i, 4),
  z_i = round(z_i, 4)
)
cat("Tabla 7.1.1 (Fondo X) reproducida:\n")
print(tabla_fondo)

# Figura: histogramas + QQ-plots (idéntica a Figuras/cap7_qqplot_comparacion.png)
azul <- "#003366"; azulClaro <- "#6699CC"
par(mfrow = c(2, 2), mar = c(4.2, 4.2, 3, 1.5))
hist(fondo, breaks = 6, col = azulClaro, border = "white",
     main = "Fondo X: retornos mensuales", xlab = "Retorno en exceso (%)",
     ylab = "Frecuencia")
qqnorm(fondo, main = "Fondo X: gráfico Q-Q", pch = 19, col = azul,
       xlab = "Cuantiles teóricos N(0,1)", ylab = "Cuantiles muestrales")
qqline(fondo, col = "firebrick", lwd = 2)
hist(reclamos, breaks = 8, col = azulClaro, border = "white",
     main = "Reclamaciones de seguros", xlab = "Monto (miles de pesos)",
     ylab = "Frecuencia")
qqnorm(reclamos, main = "Reclamaciones: gráfico Q-Q", pch = 19, col = azul,
       xlab = "Cuantiles teóricos N(0,1)", ylab = "Cuantiles muestrales")
qqline(reclamos, col = "firebrick", lwd = 2)

# --------------------------------------------------------------
# 2. Prueba de Jarque-Bera "a mano" (Definición 7.3.2, Teorema 7.3.4),
#    verificada contra tseries::jarque.bera.test()
#    (Ejemplos 7.3.5 y 7.3.6)
# --------------------------------------------------------------

jarque_bera_manual <- function(x) {
  n  <- length(x)
  m2 <- mean((x - mean(x))^2)
  m3 <- mean((x - mean(x))^3)
  m4 <- mean((x - mean(x))^4)
  g1 <- m3 / m2^1.5
  K  <- m4 / m2^2
  JB <- (n / 6) * (g1^2 + (K - 3)^2 / 4)
  valor_p <- 1 - pchisq(JB, df = 2)
  list(n = n, g1 = g1, K = K, JB = JB, valor_p = valor_p)
}

library(tseries)

cat("\n--- Reclamaciones de seguros (Ejemplo 7.3.5) ---\n")
res_reclamos <- jarque_bera_manual(reclamos)
cat(sprintf("n=%d  g1=%.4f  K=%.4f  JB=%.4f  valor-p=%.5f\n",
            res_reclamos$n, res_reclamos$g1, res_reclamos$K,
            res_reclamos$JB, res_reclamos$valor_p))
print(jarque.bera.test(reclamos))  # debe coincidir con el cálculo manual

cat("\n--- Fondo X (Ejemplo 7.3.6) ---\n")
res_fondo <- jarque_bera_manual(fondo)
cat(sprintf("n=%d  g1=%.4f  K=%.4f  JB=%.4f  valor-p=%.5f\n",
            res_fondo$n, res_fondo$g1, res_fondo$K,
            res_fondo$JB, res_fondo$valor_p))
print(jarque.bera.test(fondo))     # debe coincidir con el cálculo manual

cat("\nValor crítico chi^2_{2,0.05} =", round(qchisq(0.95, 2), 4),
    " | chi^2_{2,0.10} =", round(qchisq(0.90, 2), 4), "\n")

# --------------------------------------------------------------
# 3. Verificación por simulación: bajo H0, JB converge en
#    distribución a una chi-cuadrada con 2 g.l. (Proposición 7.3.3
#    y Teorema 7.3.4)
# --------------------------------------------------------------

set.seed(707)
n_sim   <- 10000
n_muestra <- 45  # mismo tamaño que las reclamaciones, para comparabilidad
JB_sim  <- replicate(n_sim, {
  x <- rnorm(n_muestra)
  jarque_bera_manual(x)$JB
})

cat("\n--- Simulación Monte Carlo de la distribución nula de JB (n=45) ---\n")
cat("Media simulada de JB:", round(mean(JB_sim), 3),
    " (valor teórico: E[chi^2_2] = 2)\n")
cat("Proporción de rechazos a alpha=0.05 (nominal 0.05):",
    round(mean(JB_sim > qchisq(0.95, 2)), 4), "\n")
cat("Proporción de rechazos a alpha=0.10 (nominal 0.10):",
    round(mean(JB_sim > qchisq(0.90, 2)), 4), "\n")

# La aproximación chi^2 es asintótica: con n=45 es notoriamente conservadora
# (subrechaza). Repetimos con una muestra mucho más grande para confirmar
# que la aproximación mejora conforme n crece, tal como predice la teoría.
JB_sim_grande <- replicate(n_sim, jarque_bera_manual(rnorm(1000))$JB)
cat("\n--- Misma simulación con n=1000 (para contrastar) ---\n")
cat("Media simulada de JB:", round(mean(JB_sim_grande), 3),
    " (valor teórico: 2)\n")
cat("Proporción de rechazos a alpha=0.05 (nominal 0.05):",
    round(mean(JB_sim_grande > qchisq(0.95, 2)), 4), "\n")

# QQ-plot de los valores simulados de JB contra los cuantiles teóricos
# de una chi-cuadrada con 2 g.l.: debe seguir la recta identidad
qqplot(qchisq(ppoints(n_sim), df = 2), JB_sim,
       main = expression("JB simulado vs. cuantiles teóricos de " * chi[2]^2),
       xlab = expression("Cuantiles teóricos " * chi[2]^2),
       ylab = "Cuantiles muestrales de JB", pch = 20, col = azul)
abline(0, 1, col = "firebrick", lwd = 2)

# --------------------------------------------------------------
# 4. Pruebas complementarias (Observación 7.2.3): Shapiro-Wilk,
#    Kolmogorov-Smirnov (Lilliefors) y Anderson-Darling
# --------------------------------------------------------------

library(nortest)

cat("\n--- Pruebas complementarias: Fondo X ---\n")
print(shapiro.test(fondo))
print(lillie.test(fondo))   # KS con parámetros estimados de la muestra
print(ad.test(fondo))

cat("\n--- Pruebas complementarias: reclamaciones de seguros ---\n")
print(shapiro.test(reclamos))
print(lillie.test(reclamos))
print(ad.test(reclamos))
