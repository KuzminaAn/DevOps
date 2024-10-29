# Домашнее задание к занятию 6. «Оркестрация кластером Docker контейнеров на примере Docker Swarm»

## Задача 1

1. Создала 3 ВМ
2. Docker установила 
3. На мастере выполнила команду:
```
docker swarm init --advertise-addr 10.129.0.12
```
На воркерах:
```
docker swarm join --token [token] 10.129.0.12:2377
```
4. Проверка:
```
admin@swarm-master:~$ docker node ls
ID                            HOSTNAME        STATUS    AVAILABILITY   MANAGER STATUS   ENGINE VERSION
puxv391dtsf1cmqvht1qqzxvm *   swarm-master    Ready     Active         Leader           27.3.1
sddaf7c9fepvpta8kti1h0n1o     swarm-worker1   Ready     Active                          27.3.1
kgawpghu22vaztujngfd7exv6     swarm-worker2   Ready     Active                          27.3.1
```
