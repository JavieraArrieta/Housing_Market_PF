import datetime
import time
import matplotlib.pyplot as plt
from matplotlib import style
from scipy import stats
import seaborn as sns
import pickle
import numpy as np
import pandas as pd
from sklearn.model_selection import train_test_split
import statsmodels.api as sm
from scipy.stats import pearsonr
from sklearn.metrics import mean_squared_error
import streamlit as st

st.set_page_config(page_icon="🏠:house_with_garden::house_with_garden:", 
                page_title="House Market Consulting", layout="wide")

# Cargando para guardar el modelo.
loaded_model =pickle.load(open('ML_Streamlit/Trained_Model.sav','rb'))

# Creamos una funcion para la prediccion
def prediccion_precio(input_data):
    constante = np.array([1])
    # Cambiado a array
    input_array = np.array(input_data)
    # Concatenacion
    concat_array = np.concatenate((constante, input_array), axis=0)
    # Reshape del array para la prediccion de una instancia
    input_reshape = concat_array.reshape(1,-1)
    # Prediccion por intervalo de confianza
    prediccionn = loaded_model.get_prediction(exog = input_reshape).summary_frame(alpha=0.05)
    return f"La prediccion del modelo es {round(prediccionn.loc[0,'mean'], 2)}, con un minimo de {round(prediccionn.loc[0,'mean_ci_lower'], 2)} y un maximo de {round(prediccionn.loc[0,'mean_ci_upper'], 2)}"

def main():
    st.title("Prediccion del precio de viviendas")

    # Datos ingresados por el usuario
    population = st.number_input('Poblacion') # el 10000 seria el nro por defecto
    gdp = st.number_input('PIB')
    mortgage_rate = st.number_input('Tasa Hipotecaria')
    m3 = st.number_input('m3')
    cci = st.number_input('cci')
    delinquency_rate = st.number_input('Tasa de delincuencia')
    hcai = st.number_input('hcai')

    # st.subheader("Entrada de fecha")
    # Date Input
    #st.date_input("Hoy es", datetime.datetime.now())

    # Prediccion 
    precio = ''

    # Boton de prediccion
    if st.button('Predecir'):
        precio = prediccion_precio([population ,gdp, mortgage_rate, m3, cci, delinquency_rate, hcai])

    st.success(precio)

if __name__ == '__main__':
    main()

