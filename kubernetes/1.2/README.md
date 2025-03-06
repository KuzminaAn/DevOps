# Домашнее задание к занятию «Базовые объекты K8S»

## Задание 1. Создать Pod с именем hello-world

1. Создала pod hello-world ([манифест](./manifests/hello-world.yaml))

![скриншот](./screenshots/2.1.png)

2. image - gcr.io/kubernetes-e2e-test-images/echoserver:2.2

![скриншот](./screenshots/2.2.png)

3. Подключилась локально к Pod

![скриншот](./screenshots/3.1.png)

![скриншот](./screenshots/3.2.png)

## Задание 2. Создать Service и подключить его к Pod

1. Создала Pod с именем netology-web ([манифест](./manifests/netology-web-pod.yaml))

![скриншот](./screenshots/2.2.1.png)

2. image — gcr.io/kubernetes-e2e-test-images/echoserver:2.2

![скриншот](./screenshots/2.2.2.png)

3. Создала Service с именем netology-svc и подключила к netology-web ([манифест](./manifests/netology-web-svc.yaml))

![скриншот](./screenshots/2.2.3.1.png)

![скриншот](./screenshots/2.2.3.2.png)

![скриншот](./screenshots/2.2.3.3.png)

4. Подключилась локально к Service

![скриншот](./screenshots/4.1.png)

![скриншот](./screenshots/4.2.png)
