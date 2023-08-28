Работа с БД через запуск интерфейса psql в интерактивной среде
docker exec -it test psql -U postgres

Далее могут быть команды
\l  - просомтр БД
CREATE DATABASE ...
и т.д.

Создание образа
docker build -t test_image:latest .

Можно проверить созданные образы
docker image

Запуск контейнера с созданием Тома (volume)
docker run -d -p 5432:5432 -v /data:/var/lib/postgressql/data --name test_container test_image:latest

запуск контейнера
docker run --rm --name test -e POSTGRES_PASSWORD=test -p 5432:5432 -d postgres



