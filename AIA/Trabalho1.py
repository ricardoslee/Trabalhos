import pandas as pd
import numpy as np
# %matplotlib inline

import matplotlib.pyplot as plt
import missingno as mn

import seaborn as sns

pd.__version__

df = pd.read_csv('application_train.csv',index_col=0)

semente = 2701 #Data de aniversário
df40 = pd.concat([df.iloc[:,0:30], df.iloc[:,30:].sample(10,axis=1,random_state=semente)], axis=1 )

df40.shape

df40.to_csv('application_train_40c.csv')

del df

df40 = pd.read_csv('application_train_40c.csv',index_col=0)

df40.shape

df40a = pd.get_dummies(df40)

df40a.shape

df40a.corr()

df_bureau = pd.read_csv('bureau.csv',)

df_bureau.head()

df_bureau.info(null_counts=True)

df_bureau.loc[:,['SK_ID_CURR','AMT_CREDIT_MAX_OVERDUE']]

for i in df_bureau.SK_ID_CURR:
    df_bureau.AMT_CREDIT_MAX_OVERDUE.mean()