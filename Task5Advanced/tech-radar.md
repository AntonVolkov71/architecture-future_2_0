### Технический радар

- Adopt - устоявшиеся технологи, используем в проде
    - Apache Kafka - event backbone платформы
    - Kubernetes - оркестрация микросервисов
    - Terraform - IaC - инфраструктура как код
    - PostgreSQL OLTP хранилище
    - ClickHouse аналитика БД
    - S3 / MinIO объектное хранение данных
    - Power BI BI и визуализацияя


- Trial - пробные технологии, используем в пилотах
    - Apache Flink streaming proccssing
    - Apache Iceberg lakehouse слой поверх Data Lake
    - DataHub data catalog управление метаданными
    - ABAC / OPA управление доступом

- Asset - оценочные технологии, изучаем для будущих инвестиций
    - gRPC - высоконагруженные сервисы
    - Superset / Metabase - BI альтернатива
    - Delta Lake / Apache Hudi - альтернатива Iceberg

- Hold - нежелательны для применения
    - SQL Server DWH - дорого и не масштабируется (слабо)
    - Apache Camel - только как временный мост 