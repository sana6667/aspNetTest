# ASP.NET Core + MySQL + Docker

## Как запустить
git clone https://github.com/username/AspNetLoginApp.git
cd AspNetLoginApp
sudo docker-compose up --build -d


## Если docker и docker-compose не установлен
sudo apt update
sudo apt install docker.io -y
sudo apt install docker-compose -y

## Форма логина будет http://localhost:8080/login или http://127.0.0.1:8080/login


## Посмотрите файлы Dockerfile, docker-compose.yaml, init.mysql что бы понять как будет инициализирована база данных при
## сборке контейнера.
## volumes:
##      - ./init.sql:/docker-entrypoint-initdb.d/init.sql:ro файл init.sql в котором описана база данных копируется внутрь контейнера

## Тестовый login = admin; password = secret123
