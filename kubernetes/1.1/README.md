# Домашнее задание к занятию «Kubernetes. Причины появления. Команда kubectl»

Пункты из инструкции выполнила.

## Задание 1. Установка MicroK8S

1. Установила MicroK8S на удалённую виртуальную машину

![скриншот](./screenshots/1.1.png)

2. Установила dashboard

```
microk8s enable dashboard
```
Делала по инструкции: https://microk8s.io/docs/addon-dashboard

3. Сгенерировала сертификат для подключения к внешнему ip-адресу

## Задание 2. Установка и настройка локального kubectl

1. Установила на локальную машину kubectl

![скриншот](./screenshots/2.1.png)

2. Настроила локально подключение к кластеру

![скриншот](./screenshots/2.2.1.png)
![скриншот](./screenshots/2.2.2.png)

3. Подключилась к дашборду с помощью port-forward

```
kubectl port-forward -n kube-system service/kubernetes-dashboard 10443:443
```

![скриншот](./screenshots/2.3.png)
