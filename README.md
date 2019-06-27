# Самостоятельное задание Cloud bastion
Вариант подключения в одну команду к someinternalhost используя команду:
ssh -t -A 35.210.239.172 ssh root@10.132.0.3
## Доп. задание 
Для подключения по алиасу можно добавить запись /etc/hosts на сервере bastion
10.132.0.3 someinternalhost

## Подключение через pritunl
bastion_IP = 35.210.239.172
someinternalhost_IP = 10.132.0.3

#ДЗ #4 Cloud testapp

## test app 
testapp_IP = 35.228.202.63
testapp_port = 9292

## Команда используемая для запуска gcp vm с уже рабочим приложением

```
gcloud compute instances create reddit-app1 \
--boot-disk-size=10GB \
--image-family ubuntu-1604-lts \
--image-project=ubuntu-os-cloud \
--machine-type=g1-small \
--tags puma-server \
--restart-on-failure \
--metadata-from-file startup-script=startup-script.sh
```

startup-script.sh содержит команды установки ruby, mongodb и запуска сервера puma -d. 

## Команда для удаления правила firewall 

`gcloud compute firewall-rules delete default-puma-server`

#ДЗ №5 Packer

1. Параметризирован шаблон используя 2 обязательные и 1 необязательную переменную
2. Создан файл variables.json и variables.json.example
3. Исследованы дополнительные опции, добавлены в шаблон
