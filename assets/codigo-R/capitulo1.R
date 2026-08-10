# ==============================================================
# Inferencia Estadistica - EST-11102, ITAM
# Capitulo 1: Introduccion a la Inferencia Estadistica
# Codigo correspondiente al Apendice A1.1 del capitulo (muestra
# representativa, muestreo con y sin reemplazo, factor de
# correccion para poblacion finita)
# ==============================================================

# --------------------------------------------------------------
# 1. Muestra representativa vs. muestra sesgada (ver Ejemplo del
#    capitulo). Poblacion de 1000 empresas: 200 grandes (140
#    exportadoras) y 800 pequenas (120 exportadoras), con la
#    proporcion poblacional verdadera P = (140+120)/1000 = 0.26.
# --------------------------------------------------------------
set.seed(11102)
N_emp <- 1000
tipo    <- c(rep("grande", 200), rep("pequena", 800))
exporta <- c(rep(1, 140), rep(0, 60),    # 140 de 200 grandes exportan
             rep(1, 120), rep(0, 680))   # 120 de 800 pequenas exportan
poblacion_empresas <- data.frame(tipo, exporta)

P_verdadera <- mean(poblacion_empresas$exporta)
cat("Proporcion poblacional verdadera de exportadoras:",
    round(P_verdadera, 4), "\n")

n_muestra <- 100

# --- Muestra aleatoria simple: cada empresa tiene la misma
#     probabilidad de ser elegida, sin importar su tamano ---
idx_aleatorio     <- sample(1:N_emp, n_muestra)
muestra_aleatoria <- poblacion_empresas[idx_aleatorio, ]
cat("\n--- Muestra aleatoria simple (n =", n_muestra, ") ---\n")
cat("Composicion por tipo:\n")
print(table(muestra_aleatoria$tipo))
cat("Proporcion muestral de exportadoras:",
    round(mean(muestra_aleatoria$exporta), 4),
    " (verdadera: ", round(P_verdadera, 4), ")\n", sep = "")

# --- Muestra sesgada: se toma unicamente de un directorio de
#     empresas grandes (ej. camara de comercio exterior) ---
idx_grandes     <- which(poblacion_empresas$tipo == "grande")
muestra_sesgada <- poblacion_empresas[sample(idx_grandes, n_muestra), ]
cat("\n--- Muestra sesgada: solo empresas grandes (n =", n_muestra, ") ---\n")
cat("Proporcion muestral de exportadoras:",
    round(mean(muestra_sesgada$exporta), 4),
    " (verdadera: ", round(P_verdadera, 4), ")\n", sep = "")
cat("La muestra sesgada sobreestima fuertemente la proporcion real,",
    "\naunque tiene el mismo tamano que la muestra aleatoria simple.\n")

# --------------------------------------------------------------
# 2. Muestreo aleatorio simple: con y sin reemplazo
# --------------------------------------------------------------
# "Poblacion" finita de N = 180 PyMEs con indicador binario de si
# planean invertir el proximo trimestre
set.seed(11102)
N <- 180
poblacion <- rbinom(N, size = 1, prob = 0.35)  # 35% planea invertir
p_poblacional <- mean(poblacion)
cat("Proporcion poblacional real p =", round(p_poblacional, 4), "\n")

n <- 20

# --- Muestreo CON reemplazo ---
muestra_con <- sample(poblacion, size = n, replace = TRUE)
cat("Media muestral (con reemplazo):", mean(muestra_con), "\n")

# --- Muestreo SIN reemplazo ---
muestra_sin <- sample(poblacion, size = n, replace = FALSE)
cat("Media muestral (sin reemplazo):", mean(muestra_sin), "\n")

# --- Factor de correccion por poblacion finita ---
fcp <- (N - n) / (N - 1)
cat("Factor de correccion (N-n)/(N-1) =", round(fcp, 4), "\n")
cat("Reduccion de varianza vs. poblacion 'infinita':",
    round((1 - fcp) * 100, 1), "%\n")

# --- Verificacion por simulacion Monte Carlo ---
# Comparamos la varianza empirica de la media muestral bajo ambos
# esquemas de muestreo
R_sim <- 5000
medias_con <- replicate(R_sim, mean(sample(poblacion, n, replace = TRUE)))
medias_sin <- replicate(R_sim, mean(sample(poblacion, n, replace = FALSE)))

cat("\nVarianza empirica de la media muestral:\n")
cat("  Con reemplazo:", round(var(medias_con), 5), "\n")
cat("  Sin reemplazo:", round(var(medias_sin), 5), "\n")
cat("  Razon (sin/con):", round(var(medias_sin) / var(medias_con), 4),
    "  [teorico:", round(fcp, 4), "]\n")
