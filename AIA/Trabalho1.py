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

df40a = pd.get_dumies(df40)