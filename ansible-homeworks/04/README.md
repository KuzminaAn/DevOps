# Домашнее задание "Работа с roles"

### Playbook выполняет следующие задачи:

1. ClickHouse

- Загрузка rpm пакетов для установки ClickHouse из официального репозитория 
- Установка ClickHouse пакетов(common-static, client, server) с использованием yum
- Создание БД `logs`

2. Vector

- Загрузка дистрибутива Vector и его установка
- Создание рабочей директории
- Конфигурация Vector из конфиг файла
- Создание и настройка systemd для Vector

3. LightHouse

- Проверка наличия пакетов Git и unzip
- Загрузка дистрибутива LightHouse и его распаковка
- Установка и запуск Nginx
- Конфигурация Nginx из конфиг файла

### Параметры

1. ClickHouse

- `clickhouse_version` - версия для установки
- `clickhouse_packages` - список необходимых пакетов для установки

2. Vector

- `vector_version` - версия для установки
- `vector_os` - архитектура
- `vector_workdir` - путь к рабочей директории

3. LightHouse

- `lighthouse_version` - версия для установки

### Роли 

1. ClickHouse

```
- src: git@github.com:AlexeySetevoi/ansible-clickhouse.git
    scm: git
    version: "1.13"
    name: clickhouse
```

2. Vector

```
- src: git@github.com:KuzminaAn/vector-role.git
    scm: git
    version: "1.0.0"
    name: vector-role
```

3. LightHouse

```
- src: git@github.com:KuzminaAn/lighthouse-role.git
    scm: git
    version: "1.0.1"
    name: lighthouse-role
```

### Тэги

tag: clickhouse
tag: vector
tag: lighthouse