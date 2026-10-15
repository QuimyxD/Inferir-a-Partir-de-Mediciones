# Simulación e Inferencia de Mediciones de Corriente Eléctrica en R

Este repositorio contiene la simulación y análisis de un experimento de medición de corriente eléctrica ($I = V/R$) sujeto a variabilidad aleatoria e incertidumbre, desarrollado en **R**. El objetivo es explorar cómo el número de mediciones y el cálculo del promedio acumulativo permiten inferir el valor teórico real de un fenómeno físico a pesar del ruido en los datos.

---

## Descripción del Proyecto

Aun cuando las leyes físicas establecen un valor exacto para un fenómeno en condiciones constantes, los instrumentos y procesos de medición reales introducen variabilidad. En este proyecto se simula la medición de la corriente eléctrica en una resistencia mediante el software R, agregando errores de medición distribuidos de forma normal:

$$\text{Corriente Medida} = I_{\text{teórica}} + \epsilon, \quad \text{donde } \epsilon \sim \mathcal{N}(0, 0.002)$$

### Objetivos Principales:
- Simular $n = 100$ mediciones continuas de corriente eléctrica sujeto a variabilidad aleatoria.
- Implementar el cálculo del **promedio acumulativo** para observar el comportamiento de convergencia hacia el valor teórico conforme aumenta la muestra.
- Analizar el impacto de la variación de parámetros y modelos simulados frente a los valores teóricos esperados.

---

## Fundamento Teórico y Parámetros

Según la **Ley de Ohm**:

$$I = \frac{V}{R}$$

### Parámetros Evaluados:
| Parámetro | Descripción | Valor |
| :--- | :--- | :--- |
| $V$ | Voltaje de la fuente | $10\text{ V}$ |
| $R$ | Resistencia | $100\ \Omega$ |
| $I_{\text{teórica}}$ | Corriente calculada | $0.10\text{ A}$ |
| $n$ | Número de intentos/mediciones | $100$ |
| $\sigma$ | Desviación estándar del error aleatorio | $0.002\text{ A}$ |

---

## Estructura del Código

El script en R (`T1_EI_Script_Cecil Quimey Azuara Yañez.R`) realiza las siguientes fases:

1. **Simulación de Mediciones:** Generación de 100 mediciones simuladas agregando un error aleatorio generado con `rnorm(n, mean = 0, sd = 0.002)`.
2. **Promedio Acumulativo:** Uso de la función `cumsum()` para observar la estabilización gradual de la estimación:
   $$\bar{x}_k = \frac{1}{k} \sum_{i=1}^{k} x_i, \quad k = 1, 2, \dots, n$$
3. **Análisis de Modificación del Modelo:** Evaluación del impacto en la convergencia al modificar el valor medio simulado ($I_{\text{mod}} = 0.02\text{ A}$).

---

## Visualización e Interpretación

El proyecto genera tres representaciones gráficas clave:

1. **Mediciones/Intentos Simulados:** Muestra la dispersión e incertidumbre de cada medición individual en torno al valor teórico ($0.10\text{ A}$).
2. **Promedio Acumulativo:** Muestra cómo, con pocas mediciones, el promedio fluctúa drásticamente, pero a medida que $n$ aumenta, los errores positivos y negativos se compensan y la curva converge al valor esperado.
3. **Comparación de Modelos:** Evalúa la desviación continua cuando los datos simulados provienen de una media diferente al modelo teórico real.

---

## Preguntas Reflexivas y Conclusiones

* **¿Por qué las mediciones no son idénticas si el fenómeno físico no cambia?**  
  Las fluctuaciones en instrumentos de medición y condiciones ambientales introducen variabilidad aleatoria, representada en el modelo estadístico por el término de error $\epsilon$.

* **¿Cómo se comporta el promedio acumulativo con pocas vs. muchas mediciones?**  
  Con pocas mediciones, observaciones extremas alteran considerablemente el promedio. Al aumentar $n$, las fluctuaciones disminuyen y la estimación se estabiliza.

* **¿Por qué el promedio acumulativo se acerca al valor teórico?**  
  Por la Ley de los Grandes Números y la compensación mutua de errores aleatorios positivos y negativos en muestras grandes.

---

## Archivos del Repositorio

- `T1_EI_Script_Cecil Quimey Azuara Yañez.R`: Código fuente ejecutable en R.
- `T1_EI_Doc_Cecil Quimey Azuara Yañez.pdf`: Documento explicativo con gráficas y respuestas conceptuales.

---

## Requisitos e Instalación

Para ejecutar el script, asegúrate de tener instalado R / RStudio:

```bash
# Clonar el repositorio
git clone https://github.com/tu-usuario/tu-repositorio.git

# Ejecutar el script en la consola de R
source("T1_EI_Script_Cecil Quimey Azuara Yañez.R")
```

---

## Autor y Créditos

**Cecil Quimey Azuara Yáñez**

- **Carrera:** Licenciatura en Ingeniería de Datos e Inteligencia Artificial (LIDIA).
- **Institución:** Universidad de Guanajuato – División de Ingenierías (Campus Irapuato - Salamanca).
- **Asignatura:** Estadística Inferencial.
