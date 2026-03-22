# Estrategia Predictiva para la Retención de Clientes - Telecom X

## 1. Introducción y Misión del Proyecto
La misión principal de este proyecto es desarrollar modelos de **Aprendizaje Automático (Machine Learning)** capaces de prever qué clientes tienen una mayor probabilidad de cancelar sus servicios en la empresa **Telecom X**. El objetivo es anticiparse al abandono mediante un pipeline robusto de modelado que permita a la empresa tomar acciones preventivas basadas en datos.

## 2. Objetivos del Desafío
* **Implementar el Churn como métrica central:** Definir si un cliente ha abandonado o no el programa de fidelidad.
* **Preparación de Datos:** Realizar el tratamiento, codificación (OneHotEncoding) y normalización de las variables.
* **Análisis y Selección:** Identificar correlaciones críticas entre las variables de servicio y la cancelación.
* **Modelado y Evaluación:** Entrenar modelos de clasificación y evaluar su desempeño mediante métricas de precisión, recall y exactitud.

## 3. Descripción de los Datos
El conjunto de datos original contiene información detallada sobre los servicios contratados, datos demográficos y facturación de **7,032 clientes**.

### Columnas Principales y Tipos de Datos:
* **Variables Categóricas:** Incluyen `PhoneService`, `MultipleLines`, `InternetService`, `OnlineSecurity`, `Contract`, `PaymentMethod`, entre otras.
* **Variables Numéricas:** `tenure` (antigüedad), `Charges.Monthly` (cargos mensuales), `Charges.Total` (cargos totales) y `Months_Paid`.
* **Variable Objetivo:** `Churn` (Binaria: Yes/No), que indica la fuga del cliente.

## 4. Análisis Exploratorio (EDA)
Durante la exploración, se identificó que el dataset presentaba un desbalanceo inicial: un **73.4%** de clientes activos frente a un **26.6%** que cancelaron. Para corregir esto y mejorar el entrenamiento, se aplicó la técnica **SMOTE**, logrando una distribución equilibrada del 50/50.

![Correlación de Variables](images/Correlación_de_Variables_con_Churn.png)
*Visualización de las variables con mayor impacto positivo y negativo en la cancelación.*

### Hallazgos Clave:
* **Contratos Mensuales:** Los clientes con contrato "Month-to-month" tienen una tendencia significativamente mayor al abandono.
* **Cargos Totales:** Existe una relación clara entre el tiempo de permanencia y el gasto total acumulado como factor de retención.

![Distribución de Cargos](images/Charges.Total%20por%20tipo%20de%20contrato%20y%20Churn.png)
*Análisis de cargos totales segmentados por tipo de contrato.*

![Relación Meses vs Cargos](images/Relación%20Months_Paid%20vs%20Charges.Total%20por%20tipo%20de%20contrato%20y%20cancelación.png)
*Dispersión de pagos a lo largo del tiempo según el estado de Churn.*

## 5. Creación y Evaluación de Modelos
Se implementaron dos algoritmos con enfoques distintos:
1.  **Árbol de Decisión:** Valorado por su alta explicabilidad y rapidez, operando mediante reglas lógicas de decisión.
2.  **KNN (K-Nearest Neighbors):** Basado en la distancia y similitud entre registros, requiriendo normalización previa de los datos.

![Gráfico del Árbol](images/grafico%20del%20modelo%20de%20mi%20arbol%20de%20desición.png)
*Estructura lógica de las decisiones tomadas por el algoritmo del árbol.*

### Comparativa de Métricas:

| Métrica | Árbol de Decisión | Modelo KNN |
| :--- | :--- | :--- |
| **Exactitud (Accuracy)** | **0.8096** | 0.7760 |
| **Precisión** | **0.8131** | 0.7184 |
| **Recall (Sensibilidad)** | 0.7894 | **0.8864** |



### Matrices de Confusión:
Estas matrices permiten visualizar los aciertos y errores (falsos positivos/negativos) de cada modelo:

![Matriz Árbol](images/Matriz%20de%20Confusión%20-%20Árbol%20de%20Decisión.png)
![Matriz KNN](images/Matriz%20de%20Confusión%20-%20Modelo%20KNN.png)

## 6. Conclusión: ¿Qué modelo ganó?

Aunque el **Árbol de Decisión** presenta una mayor **Exactitud (80.96%)** y **Precisión (81.31%)**, el modelo **ganador para los objetivos de Telecom X es el KNN**.

### ¿Por qué KNN?
* **Mayor Recall (88.64%):** En un problema de fuga de clientes, el costo de "perder" a un cliente que realmente se iba a ir (Falso Negativo) es mucho más alto que el de contactar a un cliente que quizás no se iba.
* **Capacidad de Detección:** El modelo KNN demostró una capacidad superior para identificar correctamente a los clientes en riesgo de cancelación, cumpliendo con la misión de anticiparse al problema de manera más efectiva.
* **Variables Críticas:** El análisis de vecinos cercanos confirmó que factores como `Dependents`, `PaperlessBilling` y `Contract` son altamente discriminativos para determinar la similitud entre clientes que abandonan.