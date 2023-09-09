# Задача 3.2
'''
import requests
import pandas as pd
import psycopg2
from datetime import datetime

# ПОдключение к существующей базе
conn = psycopg2.connect(host="localhost",
                        database="databaseSem",
                        user="username",
                        password="secret"
)
print("Successfully connected to the database.")
cur = conn.cursor()

# Формирование данных о курсе валют черех подключение по API
params_dict = {'base':'RUB', 'symbols':'BTC', 'source':'crypto', 'places':'20'}
response = requests.get('https://api.exchangerate.host/timeseries?start_date=2020-07-01&end_date=2020-07-30',
params=params_dict)
data = response.json()
print(data)

#Определение переменных для дальнейшей работы
currency1=data['base']
rates=data['rates']
res = [ (key,currency1, *item) for key,value in rates.items()
                                   for item in value.items()]

print(res)

#Вставка значений в таблицу
cur.executemany("INSERT INTO exchange_rates (api_date, currency1, currency2, rate) VALUES(%s,%s,%s,%s)", res)

conn.commit()

#Формирование Датафрейма с заголовками
df = pd.DataFrame((res), columns =["DATE", "RUB", "BTC", "RATIO"]) 
print(df)

#день, в который значение курса было максимальным
maxData = df[df['RATIO']==df['RATIO'].max()] ["DATE"].iloc[0]
print(maxData)

#день, в который значение курса было минимальным
minData = df[df['RATIO']==df['RATIO'].min()] ["DATE"].iloc[0]
print(minData)

#максимальное значение курса
maxRatio = df[df['RATIO']==df['RATIO'].max()] ["RATIO"].iloc[0]
print(maxRatio)

#минимальное значение курса
minRatio = df[df['RATIO']==df['RATIO'].min()] ["RATIO"].iloc[0]
print(minRatio)


from statistics import mean
# среднее значение курса за весь месяц в нужном формате
average_ratio = df['RATIO'].mean()
formatted_average_ratio = format(average_ratio, '.17f')
print("Average Ratio:", formatted_average_ratio)

#значение курса на последний день месяца
df_sorted = df.sort_values(by='DATE', ascending=False)
last_day_rate = df_sorted.iloc[0]['RATIO']
print("Курс на последний день месяца:", last_day_rate)

#Создание необходимых переменных
for api_date, currency1, currency2, rate in res:
       formatted_date = datetime.strptime(api_date, "%Y-%m-%d").strftime("%m")
    
month = formatted_date

#Создание новой таблицы, где будет всего одна строка,с доп столбцами номера месяца, и валют
create_table_task = '''CREATE TABLE task
                          (month VARCHAR(100),
                           currency_1 VARCHAR(100), 
                           currency_2 VARCHAR(100),
                           maxData date,
                           minData date,
                           maxRatio float,
                           minRatio float,
                           formatted_average_ratio float,
                           last_day_rate float); '''
cur.execute(create_table_task)
print("Successfully create to the database.")
cur = conn.cursor()

conn.commit()

#Перенос данных в новую таблицу.
cur.executemany("INSERT INTO task (month, currency_1, currency_2, maxData, minData, maxRatio, minRatio, formatted_average_ratio, last_day_rate) VALUES(%s,%s,%s,%s,%s,%s,%s,%s,%s)", [(formatted_date, currency1, currency2, maxData, minData, maxRatio, minRatio, formatted_average_ratio, last_day_rate)])

conn.commit()

#Закрытие курсора и соединения
cur.close()
conn.close()
'''