вывести список запущенных контейнеров

docker ps

запуск контейнера

docker exec -it 45ea56024d54 bash

Создание папки

mkdir user

Переход в локальному пути к файлу

cd D:\hue\

Оъединение файлов в один

cat *.txt >> voina.txt


Копирование файла из локал папки

docker cp D:/hue/voina.txt 45ea56024d54:/usr/task/voina.txt


копирование файла в файловую систему hfds

hdfs dfs -copyFromLocal voina.txt /user/

Проверка прав досутпа к файлу

hadoop fs -ls /user/voina.txt

Изменение прав

hadoop fs -chmod 755 /user/voina.txt

Размер файла

hadoop fs -du /user/voina.txt

Изменяем фактор репликации файла

hadoop dfs -setrep 2  /user/voina.txt


Смотрим количество строк в файла 

hadoop fs -cat /user/hive/my_loaded/sum.txt | wc -l