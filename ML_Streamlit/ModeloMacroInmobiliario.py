import datetime
import time
import matplotlib.pyplot as plt
from matplotlib import style
from scipy import stats
import seaborn as sns

import pandas as pd
from sklearn.model_selection import train_test_split
import statsmodels.api as sm
from scipy.stats import pearsonr
from sklearn.metrics import mean_squared_error
import streamlit as st

st.set_page_config(page_icon="🏠:house_with_garden::house_with_garden:", 
                page_title="House Market Consulting", layout="wide")

st.title("House Market Consulting")
c29, c30, c31 = st.columns([1, 6, 1]) # 3 columnas: 10%, 60%, 10%


# ===================================================================================================

st.subheader('Datos a usar')
datos = pd.read_csv('Housing_macroeconomic_factors_EDA.csv')
st.dataframe(datos.tail())

# modelo
X = datos[['population', 'gdp', 'mortgage_rate','ppi_res','m3','cci','delinquency_rate','hcai']]
y = datos['house_price_index']

X_train, X_test, y_train, y_test = train_test_split(
                                        X,
                                        y.values.reshape(-1,1),
                                        train_size   = 0.8,
                                        random_state = 1234,
                                        shuffle      = True
                                    )
# Creación del modelo 
st.subheader('Creacion del modelo')
X_train = sm.add_constant(X_train, prepend=True)
modelo = sm.OLS(endog=y_train, exog=X_train,)
modelo = modelo.fit()
code = modelo.summary()
st.code(code, language='python')

st.markdown('El modelo con todas las variables introducidas como predictores tiene un  R2  alto (0.972), es capaz de explicar el 97.2% de la variabilidad observada en el indice de precios de la vivienda.')

st.markdown('Acorde al p-value obtenido para el coeficiente parcial de regresión de ppi_res (indice de precios al productor) (0.693), esta variable no contribuye de forma significativa al modelo. Se entrena de nuevo el modelo, pero esta vez excluyendo el predictor ppi_res que es indice de precios al productor.')

# Se elimina la columna ppi_res del conjunto de train y test
X_train = X_train.drop(columns = 'ppi_res')
X_test  = X_test.drop(columns = 'ppi_res')

#Corremos el modelo nuevamente
X_train = sm.add_constant(X_train, prepend=True)
modelo  = sm.OLS(endog=y_train, exog=X_train,)
modelo  = modelo.fit()
code = modelo.summary()
st.code(code, language='python')

# Diagnóstico errores (residuos) de las predicciones de entrenamiento
y_train = y_train.flatten()
prediccion_train = modelo.predict(exog = X_train)
residuos_train   = prediccion_train - y_train

# Gráficos
fig, axes = plt.subplots(nrows=3, ncols=2, figsize=(9, 8))

axes[0, 0].scatter(y_train, prediccion_train, edgecolors=(0, 0, 0), alpha = 0.4)
axes[0, 0].plot([y_train.min(), y_train.max()], [y_train.min(), y_train.max()],
                        'k--', color = 'black', lw=2)
axes[0, 0].set_title('Valor predicho vs valor real', fontsize = 10, fontweight = "bold")
axes[0, 0].set_xlabel('Real')
axes[0, 0].set_ylabel('Predicción')
axes[0, 0].tick_params(labelsize = 7)

axes[0, 1].scatter(list(range(len(y_train))), residuos_train,
                        edgecolors=(0, 0, 0), alpha = 0.4)
axes[0, 1].axhline(y = 0, linestyle = '--', color = 'black', lw=2)
axes[0, 1].set_title('Residuos del modelo', fontsize = 10, fontweight = "bold")
axes[0, 1].set_xlabel('id')
axes[0, 1].set_ylabel('Residuo')
axes[0, 1].tick_params(labelsize = 7)

sns.histplot(
            data    = residuos_train,
            stat    = "density",
            kde     = True,
            line_kws= {'linewidth': 1},
            color   = "firebrick",
            alpha   = 0.3,
            ax      = axes[1, 0]
        )

axes[1, 0].set_title('Distribución residuos del modelo', fontsize = 10,
                            fontweight = "bold")
axes[1, 0].set_xlabel("Residuo")
axes[1, 0].tick_params(labelsize = 7)


sm.qqplot(
            residuos_train,
            fit   = True,
            line  = 'q',
            ax    = axes[1, 1], 
            color = 'firebrick',
            alpha = 0.4,
            lw    = 2
        )
axes[1, 1].set_title('Q-Q residuos del modelo', fontsize = 10, fontweight = "bold")
axes[1, 1].tick_params(labelsize = 7)

axes[2, 0].scatter(prediccion_train, residuos_train,
                        edgecolors=(0, 0, 0), alpha = 0.4)
axes[2, 0].axhline(y = 0, linestyle = '--', color = 'black', lw=2)
axes[2, 0].set_title('Residuos del modelo vs predicción', fontsize = 10, fontweight = "bold")
axes[2, 0].set_xlabel('Predicción')
axes[2, 0].set_ylabel('Residuo')
axes[2, 0].tick_params(labelsize = 7)

# Se eliminan los axes vacíos
fig.delaxes(axes[2,1])

fig.tight_layout()
plt.subplots_adjust(top=0.9)
fig.suptitle('Diagnóstico residuos', fontsize = 12, fontweight = "bold")
st.pyplot(fig)

st.subheader('Test de Normalidad')

st.write("Se comprueba si los residuos siguen una distribución normal empleando dos test estadísticos: Shapiro-Wilk test y D'Agostino's K-squared test(omnibus)")

# Normalidad de los residuos Shapiro-Wilk test
st.subheader('Normalidad de los residuos Shapiro-Wilk test')
shapiro_test = stats.shapiro(residuos_train)
shapiro_test

# Normalidad de los residuos D'Agostino's K-squared test
st.subheader("Normalidad de los residuos D'Agostino's K-squared test")
k2, p_value = stats.normaltest(residuos_train)
st.json({"Estadistic": k2,
                "pvalue": p_value})

# Predicciones con intervalo de confianza 
st.subheader('Predicciones con intervalo de confianza')
predicciones = modelo.get_prediction(exog = X_train).summary_frame(alpha=0.05)
st.dataframe(predicciones)

# Error de test del modelo 
X_test = sm.add_constant(X_test, prepend=True)
predicciones = modelo.predict(exog = X_test)
rmse = mean_squared_error(
                y_true  = y_test,
                y_pred  = predicciones,
                squared = False
            )
x = f"El error (rmse) de test es: {rmse}"
st.write(x)



