# Домашнее задание к занятию «Запуск приложений в K8S»

## Задание 1. Создать Deployment и обеспечить доступ к репликам приложения из другого Pod

1. Создала [Deployment](./manifests/deployment-nginx-multitool.yaml) приложения, состоящего из двух контейнеров — nginx и multitool

Возникла ошибка:

![скриншот](./screenshots/1.1.1.png)

Проблема решилась после добавления в манифест следующих строк:

```
env:
- name: HTTP_PORT
  value: "1180"
```

![скриншот](./screenshots/1.1.2.png)

2. Увеличила количество реплик работающего приложения до 2

![скриншот](./screenshots/1.2.png)

3. Создала [Service](./manifests/svc-nginx-multitool.yaml)

![скриншот](./screenshots/1.3.png)

4. Создала отдельный [Pod](./manifests/multitool-pod.yaml) с приложением multitool и проверила доступ до приложений из п.1

![скриншот](./screenshots/1.4.png)

## Задание 2. Создать Deployment и обеспечить старт основного контейнера при выполнении условий

1. Создала [Deployment](./manifests/deployment-nginx-init.yaml) приложения nginx. Старт контейнера будет только после того, как будет запущен сервис этого приложения

2. В качестве Init-контейнера взят busybox

3. Создала [Service](./manifests/svc-nginx-init.yaml)

4. Демонстрация

![скриншот](./screenshots/2.4.1.png)

![скриншот](./screenshots/2.4.2.png)

![скриншот](./screenshots/2.4.3.png)

![скриншот](./screenshots/2.4.4.png)
