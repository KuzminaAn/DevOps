# Домашнее задание к занятию «Продвинутые методы работы с Terraform»

## Задание 1

1. Решение находится в папке [vms](./vms/)
2. Установку nginx в [cloud-init.yml](vms/cloud-init.yml) добавила
3. 
![скриншот](screenshots/1.3.1.png)
![скриншот](screenshots/1.3.1.1.png)
![скриншот](screenshots/1.3.2.png)
![скриншот](screenshots/1.3.2.1.png)
![скриншот](screenshots/1.3.3.png)
![скриншот](screenshots/1.3.3.1.png)

## Задание 2

1. Решение находится в папке [local-vpc](local-vpc/), в модуль переменные передала [main.tf](local-vpc/main.tf)
![скриншот](screenshots/2.3.png)
Документацию [сгенерировала](local-vpc/vpc/README.md)

## Задание 3

1. vpc
![скриншот](screenshots/3.1.png)
![скриншот](screenshots/3.1.1.png)

2. vmc
![скриншот](screenshots/3.2.png)
![скриншот](screenshots/3.2.1.png)
![скриншот](screenshots/3.2.3.png)

## Задание 5*

1. Решение находится в папке [mysql](./mysql/)
2. План выполнения:

- создала [mysql_cluster](./mysql/mysql_cluster/main.tf)
- создала [mysql_user_db](./mysql/mysql_user_db/main.tf)
- создала [network](./mysql/network/main.tf)
- создала [основной файл](./mysql/main.tf), который использует модули
- запустила, сработало 

3. Результат:
![скриншот](screenshots/5.1.png)
![скриншот](screenshots/5.2.png)
![скриншот](screenshots/5.3.png)
![скриншот](screenshots/5.4.png)
![скриншот](screenshots/5.5.png)
![скриншот](screenshots/5.6.png)
![скриншот](screenshots/5.7.png)

## Задание 6*

1. Решение находится в папке [simple-bucket](./simple-bucket/)
2. Бакет создала
![скриншот](screenshots/6.png)

## Задание 7*

1. Решение в папке [vault](./vault). Развернула vault с помощью docker-compose.yml
![скриншот](screenshots/7.1.png)

2. Зашла в web-интерфейс

3. Новый секрет создала 
![скриншот](screenshots/7.2.png)

4. Файл [main.tf](./vault/main.tf)
![скриншот](screenshots/7.3.png)

5. Записала новый секрет в vault с помощью terraform. Решение [тут](./vault/add_secret/main.tf)
![скриншот](screenshots/7.4.png)
![скриншот](screenshots/7.4.1.png)
