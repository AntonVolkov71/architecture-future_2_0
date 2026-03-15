## CI/CD Back+Terraform


### Terraform S3
- перед использованием Terraforma с S3 хранилкой надо ее создать
  - создаем bucket Yandex Object Storage
  
```данные конфига
name: terraform-state-volkov-one
region: ru-central1
public access: off
versioning: optional
```

- создаем переменные в репозитории (поправка на ветер убираем все пароли, ключи из файла terraform.tfvars каждого окружения)
  - заходим в репозиторий проекта
  - `Settings -> Secrets and variables-Actions -> New repository secret`
  - добавляем переменные 
    - AWS_ACCESS_KEY_ID - наш пользователь в клауде
    - AWS_SECRET_ACCESS_KEY - его ключ
    - YC_CLOUD_ID - идентификатор консоли ya-cloud
    - YC_FOLDER_ID - идентификатор каталога
    - YC_TOKEN - OAuth токен аккаунта
    - SSH_PUBLIC_KEY - копируем открытую часть, ибо в репозитории не будет доступа к нашему локальному ключу

### CI/CD
- используем
- 
- поправка на 
- то есть пришли к такому что терраформ теперь не знает про ключи, доступы, они берутся из репы, во как
  - и теперь можем грузить в репозиторий файл terraform.tfvars

- создать секреты
в репозитории проекта 
Settings-Secrets and variables-Actions-New repository secret
где AWS_ACCESS_KEY_ID - наш  ползователя в клауде
  AWS_SECRET_ACCESS_KEY - его ключ

- далее 


- добавили в terraform/main.tf - данные по S3
  - endpoint, bucket, region,
    - ` key = "<путь_к_файлу_состояния_в_бакете>/<имя_файла_состояния>.tfstate"`


- добавляем файлы конфигурации для backenda S3 в каждое окружение
  - `envs/dev/backend.hcl`
  - в котором есть ключ для своего окржуения где будет храниться state


- по факту, что сделали
 