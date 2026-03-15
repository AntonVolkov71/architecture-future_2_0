## CI/CD Back+Terraform


### Простенький бекенд
- загрузка/выгрузка файла в S3 на Java SpringBoot
- [README.md](the-backend-s3/README.md)
- запускается из основного Task2Advanced/docker-compose.yaml
  - в компосе создаем хранилку и инициализируем, и бекендовый докерфайл
  - запуск из  /Task2Advanced - `docker-compose up -d`




### Terraform S3 state
- поправка на ветер
  - в первом задании исопьзовали файл terraform.tfvars и в нем руками прописывали секретеки а теперь так не пойдет, ибо файл должен храниться в репозитории, пожотму так же созадем секрты в репе

такде с клчом ssh


- то есть пришли к такому что терраформ теперь не знает про ключи, доступы, они берутся из репы, во как


- создать секреты
в репозитории проекта 
Settings-Secrets and variables-Actions-New repository secret
где AWS_ACCESS_KEY_ID - наш  ползователя в клауде
  AWS_SECRET_ACCESS_KEY - его ключ

- далее создаем bucket Yandex Object Storage
  name: terraform-state-volkov-one
  region: ru-central1
  public access: off
  versioning: optional


- добавили в terraform/main.tf - данные по S3
  - endpoint, bucket, region,
    - ` key = "<путь_к_файлу_состояния_в_бакете>/<имя_файла_состояния>.tfstate"`


- добавляем файлы конфигурации для backenda S3 в каждое окружение
  - `envs/dev/backend.hcl`
  - в котором есть ключ для своего окржуения где будет храниться state
