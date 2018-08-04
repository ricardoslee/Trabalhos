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

df40.head()

df40.info(verbose=True,null_counts=True)

mn.bar(df40,figsize=(40,6))

np.sort(df40.columns)

#array(['AMT_ANNUITY', 'AMT_CREDIT', 'AMT_GOODS_PRICE', 'AMT_INCOME_TOTAL',
#       'AMT_REQ_CREDIT_BUREAU_HOUR', 'BASEMENTAREA_MODE', 'CNT_CHILDREN',
#       'CNT_FAM_MEMBERS', 'CODE_GENDER', 'DAYS_BIRTH', 'DAYS_EMPLOYED',
#       'DAYS_ID_PUBLISH', 'DAYS_LAST_PHONE_CHANGE', 'DAYS_REGISTRATION',
#       'EMERGENCYSTATE_MODE', 'FLAG_CONT_MOBILE', 'FLAG_DOCUMENT_19',
#       'FLAG_DOCUMENT_9', 'FLAG_EMAIL', 'FLAG_EMP_PHONE', 'FLAG_MOBIL',
#       'FLAG_OWN_CAR', 'FLAG_OWN_REALTY', 'FLAG_PHONE', 'FLAG_WORK_PHONE',
#       'FLOORSMAX_MODE', 'LANDAREA_AVG', 'LIVINGAPARTMENTS_MODE',
#       'NAME_CONTRACT_TYPE', 'NAME_EDUCATION_TYPE', 'NAME_FAMILY_STATUS',
#       'NAME_HOUSING_TYPE', 'NAME_INCOME_TYPE', 'NAME_TYPE_SUITE',
#       'OBS_30_CNT_SOCIAL_CIRCLE', 'OCCUPATION_TYPE', 'OWN_CAR_AGE',
#       'REGION_POPULATION_RELATIVE', 'REGION_RATING_CLIENT', 'TARGET'],
#      dtype=object)

df40.AMT_ANNUITY.head()

df40a = pd.DataFrame()

df40a['TARGET'] = df40.TARGET
df40a.TARGET = (df40.TARGET - df40.TARGET.mean()) / (df40.TARGET.max() - df40.TARGET.min())

df40a.head()

df40a['NORM_AMT_ANNUITY'] = np.nan
df40a.NORM_AMT_ANNUITY = (df40.AMT_ANNUITY - df40.AMT_ANNUITY.mean()) / (df40.AMT_ANNUITY.max() - df40.AMT_ANNUITY.min())

df40a.head()

df40.AMT_CREDIT.head()

df40a['NORM_AMT_CREDIT'] = np.nan
df40a.NORM_AMT_CREDIT = (df40.AMT_CREDIT - df40.AMT_CREDIT.mean()) / (df40.AMT_CREDIT.max() - df40.AMT_CREDIT.min())

df40a.head()

df40a['NORM_AMT_GOODS_PRICE'] = np.nan
df40a.NORM_AMT_GOODS_PRICE = (df40.AMT_GOODS_PRICE - df40.AMT_GOODS_PRICE.mean()) / (df40.AMT_GOODS_PRICE.max() - df40.AMT_CREDIT.min())

df40a.head()

df40.AMT_INCOME_TOTAL.head()

df40a['NORM_AMT_INCOME_TOTAL'] = np.nan
df40a.NORM_AMT_INCOME_TOTAL = (df40.AMT_INCOME_TOTAL - df40.AMT_INCOME_TOTAL.mean()) / (df40.AMT_INCOME_TOTAL.max() - df40.AMT_INCOME_TOTAL.min())

df40a.head()

df40.AMT_REQ_CREDIT_BUREAU_HOUR.head()

df40a['NORM_AMT_REQ_CREDIT_BUREAU_HOUR'] = np.nan
df40a.NORM_AMT_REQ_CREDIT_BUREAU_HOUR = (df40.AMT_REQ_CREDIT_BUREAU_HOUR - df40.AMT_REQ_CREDIT_BUREAU_HOUR.mean()) / (df40.AMT_REQ_CREDIT_BUREAU_HOUR.max() - df40.AMT_REQ_CREDIT_BUREAU_HOUR.min())
df40a.NORM_AMT_REQ_CREDIT_BUREAU_HOUR.fillna(df40a.NORM_AMT_REQ_CREDIT_BUREAU_HOUR.mean(),inplace=True)
df40a.head()

df40.AMT_INCOME_TOTAL.head()

df40a['NORM_BASEMENTAREA_MODE'] = np.nan
df40a.NORM_BASEMENTAREA_MODE = (df40.BASEMENTAREA_MODE - df40.BASEMENTAREA_MODE.mean()) / (df40.BASEMENTAREA_MODE.max() - df40.BASEMENTAREA_MODE.min())
df40a.NORM_BASEMENTAREA_MODE.fillna(df40a.NORM_BASEMENTAREA_MODE.mean(),inplace=True)
df40a.head()

df40a['NORM_CNT_CHILDREN'] = np.nan
df40a.NORM_CNT_CHILDREN = (df40.CNT_CHILDREN - df40.CNT_CHILDREN.mean()) / (df40.CNT_CHILDREN.max() - df40.CNT_CHILDREN.min())
df40a.NORM_CNT_CHILDREN.fillna(0,inplace=True)
df40a.head()

df40.CNT_FAM_MEMBERS.head()

df40a['NORM_CNT_FAM_MEMBERS'] = np.nan
df40a.NORM_CNT_FAM_MEMBERS = (df40.CNT_FAM_MEMBERS - df40.CNT_FAM_MEMBERS.mean()) / (df40.CNT_FAM_MEMBERS.max() - df40.CNT_FAM_MEMBERS.min())
df40a.NORM_CNT_FAM_MEMBERS.fillna(0,inplace=True)
df40a.head()

df40.CODE_GENDER.head()

df40a['GENDER_M'] = np.nan
df40a.GENDER_M[df40.CODE_GENDER == 'M'] = 1
df40a.GENDER_M[df40.CODE_GENDER != 'M'] = 0
df40a.GENDER_M.head()

df40a['GENDER_F'] = np.nan
df40a.GENDER_F.loc[df40.CODE_GENDER == 'F'] = 1
df40a.GENDER_F.loc[df40.CODE_GENDER != 'F'] = 0
df40a.GENDER_F.head()

df40.DAYS_BIRTH.head()
df40a['NORM_DAYS_BIRTH'] = np.nan
df40a.NORM_DAYS_BIRTH = (df40.DAYS_BIRTH - df40.DAYS_BIRTH.mean()) / (df40.DAYS_BIRTH.max() - df40.DAYS_BIRTH.min())

df40a.head()

df40.DAYS_EMPLOYED.head()
df40a['NORM_DAYS_EMPLOYED'] = np.nan
df40a.NORM_DAYS_EMPLOYED = (df40.DAYS_EMPLOYED - df40.DAYS_EMPLOYED.mean()) / (df40.DAYS_EMPLOYED.max() - df40.DAYS_EMPLOYED.min())

df40.DAYS_ID_PUBLISH.head()
df40a['NORM_DAYS_ID_PUBLISH'] = np.nan
df40a.NORM_DAYS_ID_PUBLISH = (df40.DAYS_ID_PUBLISH - df40.DAYS_ID_PUBLISH.mean()) / (df40.DAYS_ID_PUBLISH.max() - df40.DAYS_ID_PUBLISH.min())

df40.DAYS_LAST_PHONE_CHANGE.head()
df40a['NORM_DAYS_LAST_PHONE_CHANGE'] = np.nan
df40a.NORM_DAYS_LAST_PHONE_CHANGE = (df40.DAYS_LAST_PHONE_CHANGE - df40.DAYS_LAST_PHONE_CHANGE.mean()) / (df40.DAYS_LAST_PHONE_CHANGE.max() - df40.DAYS_LAST_PHONE_CHANGE.min())

df40.DAYS_REGISTRATION.head()
df40a['NORM_DAYS_REGISTRATION'] = np.nan
df40a.NORM_DAYS_REGISTRATION = (df40.DAYS_REGISTRATION - df40.DAYS_REGISTRATION.mean()) / (df40.DAYS_REGISTRATION.max() - df40.DAYS_REGISTRATION.min())

df40.EMERGENCYSTATE_MODE.head()

df40a['EMERGENCYSTATE_MODE_Y'] = np.nan
df40a.EMERGENCYSTATE_MODE_Y.loc[df40.EMERGENCYSTATE_MODE == 'Yes'] = 1
df40a.EMERGENCYSTATE_MODE_Y.loc[df40.EMERGENCYSTATE_MODE != 'Yes'] = 0

df40a['EMERGENCYSTATE_MODE_N'] = np.nan
df40a.EMERGENCYSTATE_MODE_N.loc[df40.EMERGENCYSTATE_MODE == 'No'] = 1
df40a.EMERGENCYSTATE_MODE_N.loc[df40.EMERGENCYSTATE_MODE != 'No'] = 0

set(df40.FLAG_CONT_MOBILE)
df40a['FLAG_CONT_MOBILE'] = df40.FLAG_CONT_MOBILE

set(df40.FLAG_DOCUMENT_19)
df40a['FLAG_DOCUMENT_19'] = df40.FLAG_DOCUMENT_19

set(df40.FLAG_DOCUMENT_9)
df40a['FLAG_DOCUMENT_9'] = df40.FLAG_DOCUMENT_9

set(df40.FLAG_EMAIL)
df40a['FLAG_EMAIL'] = df40.FLAG_EMAIL

set(df40.FLAG_EMP_PHONE)
df40a['FLAG_EMP_PHONE'] = df40.FLAG_EMP_PHONE

set(df40.FLAG_MOBIL)
df40a['FLAG_MOBIL'] = df40.FLAG_MOBIL

set(df40.FLAG_OWN_CAR)
df40a['FLAG_OWN_CAR_Y'] = np.nan
df40a.FLAG_OWN_CAR_Y.loc[df40.FLAG_OWN_CAR == 'Y'] = 1
df40a.FLAG_OWN_CAR_Y.loc[df40.FLAG_OWN_CAR != 'Y'] = 0

df40a['FLAG_OWN_CAR_N'] = np.nan
df40a.FLAG_OWN_CAR_N.loc[df40.FLAG_OWN_CAR == 'N'] = 1
df40a.FLAG_OWN_CAR_N.loc[df40.FLAG_OWN_CAR != 'N'] = 0

set(df40.FLAG_OWN_REALTY)
df40a['FLAG_OWN_REALTY_Y'] = np.nan
df40a.FLAG_OWN_REALTY_Y.loc[df40.FLAG_OWN_REALTY == 'Y'] = 1
df40a.FLAG_OWN_REALTY_Y.loc[df40.FLAG_OWN_REALTY != 'Y'] = 0

df40a['FLAG_OWN_REALTY_N'] = np.nan
df40a.FLAG_OWN_REALTY_N.loc[df40.FLAG_OWN_REALTY == 'N'] = 1
df40a.FLAG_OWN_REALTY_N.loc[df40.FLAG_OWN_REALTY != 'N'] = 0

set(df40.FLAG_PHONE)
df40a['FLAG_PHONE'] = df40.FLAG_PHONE

set(df40.FLAG_WORK_PHONE)
df40a['FLAG_WORK_PHONE'] = df40.FLAG_WORK_PHONE

df40.FLOORSMAX_MODE.head()
df40a['NORM_FLOORSMAX_MODE'] = np.nan
df40a.NORM_FLOORSMAX_MODE = (df40.FLOORSMAX_MODE - df40.FLOORSMAX_MODE.mean()) / (df40.FLOORSMAX_MODE.max() - df40.FLOORSMAX_MODE.min())
df40a.NORM_FLOORSMAX_MODE.fillna(df40a.NORM_FLOORSMAX_MODE.mean(),inplace=True)
df40a.head()

df40.LANDAREA_AVG.head()
df40a['NORM_LANDAREA_AVG'] = np.nan
df40a.NORM_LANDAREA_AVG = (df40.LANDAREA_AVG - df40.LANDAREA_AVG.mean()) / (df40.LANDAREA_AVG.max() - df40.LANDAREA_AVG.min())
df40a.NORM_LANDAREA_AVG.fillna(df40a.NORM_LANDAREA_AVG.mean(),inplace=True)
df40a.head()

df40.LIVINGAPARTMENTS_MODE.head()
df40a['NORM_LIVINGAPARTMENTS_MODE'] = np.nan
df40a.NORM_LIVINGAPARTMENTS_MODE = (df40.LIVINGAPARTMENTS_MODE - df40.LIVINGAPARTMENTS_MODE.mean()) / (df40.LIVINGAPARTMENTS_MODE.max() - df40.LIVINGAPARTMENTS_MODE.min())
df40a.NORM_LIVINGAPARTMENTS_MODE.fillna(df40a.NORM_LIVINGAPARTMENTS_MODE.mean(),inplace=True)
df40a.head()

df40.NAME_CONTRACT_TYPE.head()
set(df40.NAME_CONTRACT_TYPE)
df40a['NAME_CONTRACT_TYPE_C'] = np.nan
df40a.NAME_CONTRACT_TYPE_C.loc[df40.NAME_CONTRACT_TYPE == 'Cash loans'] = 1
df40a.NAME_CONTRACT_TYPE_C.loc[df40.NAME_CONTRACT_TYPE != 'Cash loans'] = 0

df40a['NAME_CONTRACT_TYPE_R'] = np.nan
df40a.NAME_CONTRACT_TYPE_R.loc[df40.NAME_CONTRACT_TYPE == 'Revolving loans'] = 1
df40a.NAME_CONTRACT_TYPE_R.loc[df40.NAME_CONTRACT_TYPE != 'Revolving loans'] = 0

set(df40.NAME_EDUCATION_TYPE) 
df40a['NAME_EDUCATION_TYPE_L'] = np.nan
df40a.NAME_EDUCATION_TYPE_L.loc[df40.NAME_EDUCATION_TYPE == 'Lower secondary'] = 1
df40a.NAME_EDUCATION_TYPE_L.loc[df40.NAME_EDUCATION_TYPE != 'Lower secondary'] = 0

df40a['NAME_EDUCATION_TYPE_A'] = np.nan
df40a.NAME_EDUCATION_TYPE_A.loc[df40.NAME_EDUCATION_TYPE == 'Academic degree'] = 1
df40a.NAME_EDUCATION_TYPE_A.loc[df40.NAME_EDUCATION_TYPE != 'Academic degree'] = 0

df40a['NAME_EDUCATION_TYPE_S'] = np.nan
df40a.NAME_EDUCATION_TYPE_S.loc[df40.NAME_EDUCATION_TYPE == 'Secondary / secondary special'] = 1
df40a.NAME_EDUCATION_TYPE_S.loc[df40.NAME_EDUCATION_TYPE != 'Secondary / secondary special'] = 0

df40a['NAME_EDUCATION_TYPE_S'] = np.nan
df40a.NAME_EDUCATION_TYPE_S.loc[df40.NAME_EDUCATION_TYPE == 'Higher education'] = 1
df40a.NAME_EDUCATION_TYPE_S.loc[df40.NAME_EDUCATION_TYPE != 'Higher education'] = 0

df40a['NAME_EDUCATION_TYPE_I'] = np.nan
df40a.NAME_EDUCATION_TYPE_I.loc[df40.NAME_EDUCATION_TYPE == 'Incomplete higher'] = 1
df40a.NAME_EDUCATION_TYPE_I.loc[df40.NAME_EDUCATION_TYPE != 'Incomplete higher'] = 0

set(df40.NAME_FAMILY_STATUS)
df40a['NAME_FAMILY_STATUS_C'] = np.nan
df40a.NAME_FAMILY_STATUS_C.loc[df40.NAME_FAMILY_STATUS == 'Civil marriage'] = 1
df40a.NAME_FAMILY_STATUS_C.loc[df40.NAME_FAMILY_STATUS != 'Civil marriage'] = 0

df40a['NAME_FAMILY_STATUS_U'] = np.nan
df40a.NAME_FAMILY_STATUS_U.loc[df40.NAME_FAMILY_STATUS == 'Unknown'] = 1
df40a.NAME_FAMILY_STATUS_U.loc[df40.NAME_FAMILY_STATUS != 'Unknown'] = 0

df40a['NAME_FAMILY_STATUS_S'] = np.nan
df40a.NAME_FAMILY_STATUS_S.loc[df40.NAME_FAMILY_STATUS == 'Separated'] = 1
df40a.NAME_FAMILY_STATUS_S.loc[df40.NAME_FAMILY_STATUS != 'Separated'] = 0

df40a['NAME_FAMILY_STATUS_W'] = np.nan
df40a.NAME_FAMILY_STATUS_W.loc[df40.NAME_FAMILY_STATUS == 'Widow'] = 1
df40a.NAME_FAMILY_STATUS_W.loc[df40.NAME_FAMILY_STATUS != 'Widow'] = 0

df40a['NAME_FAMILY_STATUS_M'] = np.nan
df40a.NAME_FAMILY_STATUS_M.loc[df40.NAME_FAMILY_STATUS == 'Married'] = 1
df40a.NAME_FAMILY_STATUS_M.loc[df40.NAME_FAMILY_STATUS != 'Married'] = 0

df40a['NAME_FAMILY_STATUS_SNM'] = np.nan
df40a.NAME_FAMILY_STATUS_SNM.loc[df40.NAME_FAMILY_STATUS == 'Single / not married'] = 1
df40a.NAME_FAMILY_STATUS_SNM.loc[df40.NAME_FAMILY_STATUS != 'Single / not married'] = 0

set(df40.NAME_HOUSING_TYPE)
df40a['NAME_HOUSING_TYPE_O'] = np.nan
df40a.NAME_HOUSING_TYPE_O.loc[df40.NAME_HOUSING_TYPE == 'Office apartment'] = 1
df40a.NAME_HOUSING_TYPE_O.loc[df40.NAME_HOUSING_TYPE != 'Office apartment'] = 0

df40a['NAME_HOUSING_TYPE_C'] = np.nan
df40a.NAME_HOUSING_TYPE_C.loc[df40.NAME_HOUSING_TYPE == 'Co-op apartment'] = 1
df40a.NAME_HOUSING_TYPE_C.loc[df40.NAME_HOUSING_TYPE != 'Co-op apartment'] = 0

df40a['NAME_HOUSING_TYPE_W'] = np.nan
df40a.NAME_HOUSING_TYPE_W.loc[df40.NAME_HOUSING_TYPE == 'With parents'] = 1
df40a.NAME_HOUSING_TYPE_W.loc[df40.NAME_HOUSING_TYPE != 'With parents'] = 0

df40a['NAME_HOUSING_TYPE_R'] = np.nan
df40a.NAME_HOUSING_TYPE_R.loc[df40.NAME_HOUSING_TYPE == 'Rented apartment'] = 1
df40a.NAME_HOUSING_TYPE_R.loc[df40.NAME_HOUSING_TYPE != 'Rented apartment'] = 0

df40a['NAME_HOUSING_TYPE_M'] = np.nan
df40a.NAME_HOUSING_TYPE_M.loc[df40.NAME_HOUSING_TYPE == 'Municipal apartment'] = 1
df40a.NAME_HOUSING_TYPE_M.loc[df40.NAME_HOUSING_TYPE != 'Municipal apartment'] = 0

df40a['NAME_HOUSING_TYPE_H'] = np.nan
df40a.NAME_HOUSING_TYPE_H.loc[df40.NAME_HOUSING_TYPE == 'House / apartment'] = 1
df40a.NAME_HOUSING_TYPE_H.loc[df40.NAME_HOUSING_TYPE != 'House / apartment'] = 0

set(df40.NAME_INCOME_TYPE)
df40a['NAME_INCOME_TYPE_C'] = np.nan
df40a.NAME_INCOME_TYPE_C.loc[df40.NAME_INCOME_TYPE == 'Commercial associate'] = 1
df40a.NAME_INCOME_TYPE_C.loc[df40.NAME_INCOME_TYPE != 'Commercial associate'] = 0

df40a['NAME_INCOME_TYPE_U'] = np.nan
df40a.NAME_INCOME_TYPE_U.loc[df40.NAME_INCOME_TYPE == 'Unemployed'] = 1
df40a.NAME_INCOME_TYPE_U.loc[df40.NAME_INCOME_TYPE != 'Unemployed'] = 0

df40a['NAME_INCOME_TYPE_W'] = np.nan
df40a.NAME_INCOME_TYPE_W.loc[df40.NAME_INCOME_TYPE == 'Working'] = 1
df40a.NAME_INCOME_TYPE_W.loc[df40.NAME_INCOME_TYPE != 'Working'] = 0

df40a['NAME_INCOME_TYPE_P'] = np.nan
df40a.NAME_INCOME_TYPE_P.loc[df40.NAME_INCOME_TYPE == 'Pensioner'] = 1
df40a.NAME_INCOME_TYPE_P.loc[df40.NAME_INCOME_TYPE != 'Pensioner'] = 0

df40a['NAME_INCOME_TYPE_B'] = np.nan
df40a.NAME_INCOME_TYPE_B.loc[df40.NAME_INCOME_TYPE == 'Businessman'] = 1
df40a.NAME_INCOME_TYPE_B.loc[df40.NAME_INCOME_TYPE != 'Businessman'] = 0

df40a['NAME_INCOME_TYPE_S'] = np.nan
df40a.NAME_INCOME_TYPE_S.loc[df40.NAME_INCOME_TYPE == 'Student'] = 1
df40a.NAME_INCOME_TYPE_S.loc[df40.NAME_INCOME_TYPE != 'Student'] = 0

df40a['NAME_INCOME_TYPE_SS'] = np.nan
df40a.NAME_INCOME_TYPE_SS.loc[df40.NAME_INCOME_TYPE == 'State servant'] = 1
df40a.NAME_INCOME_TYPE_SS.loc[df40.NAME_INCOME_TYPE != 'State servant'] = 0

df40a['NAME_INCOME_TYPE_ML'] = np.nan
df40a.NAME_INCOME_TYPE_ML.loc[df40.NAME_INCOME_TYPE == 'Maternity leave'] = 1
df40a.NAME_INCOME_TYPE_ML.loc[df40.NAME_INCOME_TYPE != 'Maternity leave'] = 0

set(df40.NAME_TYPE_SUITE)
df40a['NAME_TYPE_SUITE_OB'] = np.nan
df40a.NAME_TYPE_SUITE_OB.loc[df40.NAME_TYPE_SUITE == 'Other_B'] = 1
df40a.NAME_TYPE_SUITE_OB.loc[df40.NAME_TYPE_SUITE != 'Other_B'] = 0

df40a['NAME_TYPE_SUITE_F'] = np.nan
df40a.NAME_TYPE_SUITE_F.loc[df40.NAME_TYPE_SUITE == 'Family'] = 1
df40a.NAME_TYPE_SUITE_F.loc[df40.NAME_TYPE_SUITE != 'Family'] = 0

df40a['NAME_TYPE_SUITE_OA'] = np.nan
df40a.NAME_TYPE_SUITE_OA.loc[df40.NAME_TYPE_SUITE == 'Other_A'] = 1
df40a.NAME_TYPE_SUITE_OA.loc[df40.NAME_TYPE_SUITE != 'Other_A'] = 0

df40a['NAME_TYPE_SUITE_G'] = np.nan
df40a.NAME_TYPE_SUITE_G.loc[df40.NAME_TYPE_SUITE == 'Group of people'] = 1
df40a.NAME_TYPE_SUITE_G.loc[df40.NAME_TYPE_SUITE != 'Group of people'] = 0

df40a['NAME_TYPE_SUITE_C'] = np.nan
df40a.NAME_TYPE_SUITE_C.loc[df40.NAME_TYPE_SUITE == 'Children'] = 1
df40a.NAME_TYPE_SUITE_C.loc[df40.NAME_TYPE_SUITE != 'Children'] = 0

df40a['NAME_TYPE_SUITE_U'] = np.nan
df40a.NAME_TYPE_SUITE_U.loc[df40.NAME_TYPE_SUITE == 'Unaccompanied'] = 1
df40a.NAME_TYPE_SUITE_U.loc[df40.NAME_TYPE_SUITE != 'Unaccompanied'] = 0

df40a['NAME_TYPE_SUITE_S'] = np.nan
df40a.NAME_TYPE_SUITE_S.loc[df40.NAME_TYPE_SUITE == 'Spouse, partner'] = 1
df40a.NAME_TYPE_SUITE_S.loc[df40.NAME_TYPE_SUITE != 'Spouse, partner'] = 0

set(df40.OBS_30_CNT_SOCIAL_CIRCLE)

set(df40.OCCUPATION_TYPE)

#set(df40.OWN_CAR_AGE)

#set(df40.REGION_POPULATION_RELATIVE)

set(df40.REGION_RATING_CLIENT)

pd.get_dummies(df40)
df40.shape

df40a.corr()

#       'OBS_30_CNT_SOCIAL_CIRCLE', 'OCCUPATION_TYPE', 'OWN_CAR_AGE',
#       'REGION_POPULATION_RELATIVE', 'REGION_RATING_CLIENT', 'TARGET'],
#      dtype=object)
