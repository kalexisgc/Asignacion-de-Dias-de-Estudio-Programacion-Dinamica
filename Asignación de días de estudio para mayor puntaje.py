# Tabla de beneficios: tabla[i][k] = puntos del curso i con k dias
tabla_beneficios = [
    [0, 1, 3, 6, 8],    # Curso 1
    [0, 5, 6, 8, 8],    # Curso 2
    [0, 4, 6, 7, 9],    # Curso 3
    [0, 4, 4, 5, 8]     # Curso 4
]
num_cursos = 4
dias_totales = 7

# --- PROGRAMACION DINAMICA ---
# Inicializar matriz con -inf
matriz_pd = []
for i in range(num_cursos + 1):
    fila = []
    for j in range(dias_totales + 1):
        fila.append(float('-inf'))
    matriz_pd.append(fila)

# Inicializar matriz de decisiones con 0
matriz_decision = []
for i in range(num_cursos + 1):
    fila = []
    for j in range(dias_totales + 1):
        fila.append(0)
    matriz_decision.append(fila)

matriz_pd[0][0] = 0

for i in range(1, num_cursos + 1):
    for j in range(dias_totales + 1):
        max_beneficio = float('-inf')
        mejor_k = 0
        curso_idx = i - 1
        
        # RESTRICCION CLAVE: minimo 1 dia por curso
        k_min = 1
        k_max = min(4, j, j - (i - 1))  # Dejar dias para los demas cursos
        
        for k in range(k_min, k_max + 1):
            beneficio = tabla_beneficios[curso_idx][k] + matriz_pd[i-1][j-k]
            if beneficio > max_beneficio:
                max_beneficio = beneficio
                mejor_k = k
        
        matriz_pd[i][j] = max_beneficio
        matriz_decision[i][j] = mejor_k

# --- BACKTRACKING ---
asignacion = []
dias_restantes = dias_totales
for i in range(num_cursos, 0, -1):
    dias_asignados = matriz_decision[i][dias_restantes]
    asignacion.append({
        'curso': f"Curso {i}",
        'dias': dias_asignados,
        'puntos': tabla_beneficios[i-1][dias_asignados]
    })
    dias_restantes -= dias_asignados

# --- RESULTADOS ---
asignacion.reverse()
for a in asignacion:
    print(f"{a['curso']}: {a['dias']} dias -> {a['puntos']} puntos")
print(f"TOTAL: {sum(a['puntos'] for a in asignacion)} puntos")