# ==============================================================
# Inferencia Estadistica - EST-11102, ITAM
# Capitulo 3: Distribuciones Muestrales y el Teorema Central del Limite
# Codigo correspondiente al Apendice del capitulo (A3.0-A3.3)
# ==============================================================

# --------------------------------------------------------------
# A3.0 Verificacion por simulacion de las distribuciones nuevas
#      obtenidas a partir de la Normal (Seccion 3.2.1, Definiciones
#      3.2.1-3.2.3). Solucion de referencia del Ejercicio de
#      verificacion por simulacion en R.
# --------------------------------------------------------------
set.seed(2026)
B <- 10000

# --- (a) Ji-cuadrada: W = suma de n=8 normales estandar al cuadrado ---
n_chi <- 8
W <- replicate(B, sum(rnorm(n_chi)^2))

par(mfrow = c(1, 1))
hist(W, breaks = 60, freq = FALSE, col = "lightblue", border = "white",
     main = expression(paste("Simulacion de ", chi[8]^2)),
     xlab = "w", ylab = "Densidad")
curve(dchisq(x, df = n_chi), col = "red", lwd = 2, add = TRUE)
legend("topright", legend = c("Simulacion", expression(chi[8]^2)),
       fill = c("lightblue", NA), lty = c(NA, 1),
       col = c(NA, "red"), lwd = c(NA, 2), bty = "n")

cat("--- Verificacion Ji-cuadrada (n=8 grados de libertad) ---\n")
cat("Media simulada:    ", round(mean(W), 3), " (teorica: ", n_chi, ")\n", sep = "")
cat("Varianza simulada: ", round(var(W), 3),  " (teorica: ", 2 * n_chi, ")\n", sep = "")

# --- (b) t de Student: T = X / sqrt(Y/nu), X~N(0,1), Y~chi2_nu ---
nu_t <- 5
X_t  <- rnorm(B)
Y_t  <- replicate(B, sum(rnorm(nu_t)^2))
Tsim <- X_t / sqrt(Y_t / nu_t)

hist(Tsim, breaks = 80, freq = FALSE, col = "lightgreen", border = "white",
     xlim = c(-6, 6),
     main = expression(paste("Simulacion de ", t[5])),
     xlab = "t", ylab = "Densidad")
curve(dt(x, df = nu_t), col = "red", lwd = 2, add = TRUE)
legend("topright", legend = c("Simulacion", expression(t[5])),
       fill = c("lightgreen", NA), lty = c(NA, 1),
       col = c(NA, "red"), lwd = c(NA, 2), bty = "n")

cat("\n--- Verificacion t de Student (nu=5 grados de libertad) ---\n")
cat("Media simulada:    ", round(mean(Tsim), 3), " (teorica: 0)\n", sep = "")
cat("Varianza simulada: ", round(var(Tsim), 3),
    " (teorica: ", round(nu_t / (nu_t - 2), 3), ")\n", sep = "")

# --- (c) F de Fisher: F = (X/n)/(Y/m), X~chi2_n, Y~chi2_m ---
n_f <- 6; m_f <- 10
Xf  <- replicate(B, sum(rnorm(n_f)^2))
Yf  <- replicate(B, sum(rnorm(m_f)^2))
Fsim <- (Xf / n_f) / (Yf / m_f)

hist(Fsim, breaks = 80, freq = FALSE, col = "lightyellow", border = "white",
     xlim = c(0, 6),
     main = expression(paste("Simulacion de ", F[list(6,10)])),
     xlab = "F", ylab = "Densidad")
curve(df(x, df1 = n_f, df2 = m_f), col = "red", lwd = 2, add = TRUE)
legend("topright", legend = c("Simulacion", expression(F[list(6,10)])),
       fill = c("lightyellow", NA), lty = c(NA, 1),
       col = c(NA, "red"), lwd = c(NA, 2), bty = "n")

cat("\n--- Verificacion F de Fisher (n=6, m=10 grados de libertad) ---\n")
cat("Media simulada:    ", round(mean(Fsim), 3),
    " (teorica: ", round(m_f / (m_f - 2), 3), ")\n", sep = "")

# Verificacion de la propiedad F_(n,m) = 1 / F_(m,n)
Fsim_inv    <- 1 / Fsim               # debe distribuirse F_(10,6)
Fsim_directo <- (Yf / m_f) / (Xf / n_f)  # F_(10,6) simulada directamente
cat("\nPropiedad F_(n,m) = 1 / F_(m,n):\n")
cat("Media de 1/F simulada:            ", round(mean(Fsim_inv), 3), "\n")
cat("Media de F_(10,6) simulada directo:", round(mean(Fsim_directo), 3), "\n")
cat("(ambas deben acercarse a la misma teorica, no definida si m<=2)\n")

# --------------------------------------------------------------
# A3.1 Verificacion por simulacion de la distribucion de muestreo
#      de la media muestral (Teorema 3.2.1: Xbarra | sigma^2 conocida)
# --------------------------------------------------------------
mu    <- 5
sigma <- 3
n     <- 25         # tamano de muestra
B     <- 10000      # numero de muestras simuladas

set.seed(123)

# Generamos B muestras de tamano n y calculamos la media de cada una
medias <- replicate(B, mean(rnorm(n, mean = mu, sd = sigma)))

par(mfrow = c(1, 1))
hist(medias,
     breaks  = 60,
     freq    = FALSE,
     col     = "lightblue",
     border  = "white",
     main    = expression(paste("Distribucion de muestreo de ",
                                bar(X), " con n=25")),
     xlab    = expression(bar(x)),
     ylab    = "Densidad")

# Superponemos la densidad teorica N(mu, sigma^2/n)
x_seq <- seq(mu - 4*sigma/sqrt(n), mu + 4*sigma/sqrt(n), length.out = 300)
lines(x_seq, dnorm(x_seq, mean = mu, sd = sigma/sqrt(n)),
      col = "red", lwd = 2)
legend("topright",
       legend = c("Simulacion", expression(N(mu, sigma^2/n))),
       fill   = c("lightblue", NA),
       lty    = c(NA, 1), col = c(NA, "red"),
       lwd    = c(NA, 2), bty = "n")

cat("Media de las medias simuladas: ", round(mean(medias), 4),
    " (teorica:", mu, ")\n")
cat("Var. de las medias simuladas:  ", round(var(medias), 4),
    " (teorica:", sigma^2/n, ")\n")

# --------------------------------------------------------------
# A3.2 Distribuciones chi-cuadrada, t de Student y F de Fisher
#      (Seccion 3.2: distribuciones muestrales bajo poblacion normal)
# --------------------------------------------------------------
par(mfrow = c(1, 3), mar = c(4, 4, 3, 1))
x <- seq(0.001, 20, length.out = 500)

# --- Ji-cuadrada ---
plot(x, dchisq(x, df = 5),  type = "l", col = "blue",   lwd = 2,
     main = "Distribucion ji-cuadrada",
     xlab = "x", ylab = "Densidad", ylim = c(0, 0.2))
lines(x, dchisq(x, df = 10), col = "red",    lwd = 2)
lines(x, dchisq(x, df = 20), col = "darkgreen", lwd = 2)
legend("topright",
       legend = c("gl=5", "gl=10", "gl=20"),
       col    = c("blue", "red", "darkgreen"),
       lwd    = 2, bty = "n")

# --- t de Student ---
x2 <- seq(-5, 5, length.out = 500)
plot(x2, dt(x2, df = 2),  type = "l", col = "blue",  lwd = 2,
     main = "Distribucion t de Student",
     xlab = "t", ylab = "Densidad")
lines(x2, dt(x2, df = 10), col = "red",       lwd = 2)
lines(x2, dnorm(x2),       col = "darkgreen", lwd = 2, lty = 2)
legend("topright",
       legend = c("gl=2", "gl=10", "N(0,1)"),
       col    = c("blue", "red", "darkgreen"),
       lwd    = 2, lty = c(1, 1, 2), bty = "n")

# --- F de Fisher ---
x3 <- seq(0.001, 6, length.out = 500)
plot(x3, df(x3, df1 = 5,  df2 = 10), type = "l", col = "blue", lwd = 2,
     main = "Distribucion F de Fisher",
     xlab = "F", ylab = "Densidad")
lines(x3, df(x3, df1 = 10, df2 = 20), col = "red",       lwd = 2)
lines(x3, df(x3, df1 = 20, df2 = 50), col = "darkgreen", lwd = 2)
legend("topright",
       legend = c("F(5,10)", "F(10,20)", "F(20,50)"),
       col    = c("blue", "red", "darkgreen"),
       lwd    = 2, bty = "n")

# --------------------------------------------------------------
# A3.3 Aproximacion normal a la binomial con correccion por
#      continuidad (Seccion 3.3, Teorema de De Moivre-Laplace)
# --------------------------------------------------------------

# --- Funcion auxiliar: aproximacion normal con correccion de continuidad
aprox_normal_binomial <- function(a, b, n, p) {
  # Aproxima P(a <= X <= b) para X ~ Binomial(n,p) usando
  # correccion por continuidad
  mu_x    <- n * p
  sigma_x <- sqrt(n * p * (1 - p))
  z_sup   <- (b + 0.5 - mu_x) / sigma_x
  z_inf   <- (a - 0.5 - mu_x) / sigma_x
  pnorm(z_sup) - pnorm(z_inf)
}

# --- Ejemplo 3.3.1: control de calidad (n=200, p=0.08) ---
n1 <- 200; p1 <- 0.08
prob_exacta_1 <- pbinom(12, size = n1, prob = p1)          # P(X <= 12)
prob_aprox_1  <- aprox_normal_binomial(0, 12, n1, p1)

cat("\n--- Ejemplo: control de calidad, n=200, p=0.08 ---\n")
cat("P(X <= 12) exacta (binomial):        ", round(prob_exacta_1, 4), "\n")
cat("P(X <= 12) aproximada (normal, c.c.):", round(prob_aprox_1, 4), "\n")

# --- Ejemplo 3.3.2: riesgo de credito de un portafolio (n=250, p=0.04) ---
n2 <- 250; p2 <- 0.04
prob_exacta_2 <- 1 - pbinom(15, size = n2, prob = p2)       # P(X > 15) = P(X >= 16)
prob_aprox_2  <- 1 - aprox_normal_binomial(0, 15, n2, p2)   # complemento de P(X<=15)

cat("\n--- Ejemplo: riesgo de credito, n=250, p=0.04 ---\n")
cat("P(X > 15) exacta (binomial):         ", round(prob_exacta_2, 4), "\n")
cat("P(X > 15) aproximada (normal, c.c.): ", round(prob_aprox_2, 4), "\n")

# --- Comparacion grafica: binomial exacta vs. aproximacion normal ---
# Se usa el ejemplo de riesgo de credito (n=250, p=0.04)
x_bin   <- 0:35
masa    <- dbinom(x_bin, size = n2, prob = p2)
mu_x    <- n2 * p2
sigma_x <- sqrt(n2 * p2 * (1 - p2))
x_cont  <- seq(0, 35, length.out = 400)
densidad_normal <- dnorm(x_cont, mean = mu_x, sd = sigma_x)

par(mfrow = c(1, 1), mar = c(4, 4, 3, 1))
plot(x_bin, masa, type = "h", lwd = 6, col = "lightblue",
     main = "Binomial(250, 0.04) vs. aproximacion normal",
     xlab = "Numero de creditos en incumplimiento (x)",
     ylab = "Probabilidad / densidad")
lines(x_cont, densidad_normal, col = "red", lwd = 2)
legend("topright",
       legend = c("Binomial exacta", expression(N(np, np(1-p)))),
       col    = c("lightblue", "red"),
       lwd    = c(6, 2), bty = "n")

# --- Regla practica: np > 5 y n(1-p) > 5 ---
cat("\n--- Verificacion de la regla practica ---\n")
cat("Ejemplo 1: np =", n1*p1, ", n(1-p) =", n1*(1-p1), "\n")
cat("Ejemplo 2: np =", n2*p2, ", n(1-p) =", n2*(1-p2), "\n")
