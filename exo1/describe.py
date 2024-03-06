# -*- coding: utf-8 -*-


##########Création de module 

'''
Ce module nous servira à stocker nos fonctions utilisées tout au long de notre
projet.

'''


##Import de librairies

import os
os.getcwd()

import os 
import pandas as pd
import numpy as np


##Fonction pour des infos sommaires sur le dataframe

def data_summary(df):
    # Afficher les informations générales sur le DataFrame
    print("Informations générales sur le DataFrame:")
    print(df.info())
    print("\n")

    # Vérifier les valeurs nulles dans le DataFrame
    print("Valeurs manquantes dans le DataFrame:")
    print(df.isna().sum())
    print("\n")

    





























