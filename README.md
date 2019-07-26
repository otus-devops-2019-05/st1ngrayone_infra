## Самостоятельное задание Cloud bastion HW 3
Вариант подключения в одну команду к someinternalhost используя команду:
ssh -t -A 35.210.239.172 ssh root@10.132.0.3
### Доп. задание 
Для подключения по алиасу можно добавить запись /etc/hosts на сервере bastion
10.132.0.3 someinternalhost

## Подключение через pritunl
bastion_IP = 35.210.239.172
someinternalhost_IP = 10.132.0.3

## Cloud testapp HW # 4

### test app 
testapp_IP = 35.228.202.63
testapp_port = 9292

### Команда используемая для запуска gcp vm с уже рабочим приложением

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

### Команда для удаления правила firewall 

`gcloud compute firewall-rules delete default-puma-server`

## Packer HW # 5

Ubuntu16.json - packer-base шаблон для создания образа ВМ в gcp. 
Для создания образа необходимо создать файл с переменными variables.json и передать команде
`Packer build -var-file=variables.json ubuntu16.json`
variable.json.examble - пример создания файла с переменными. 

## Terraform project HW # 6

 - Добавлены input переменные в проект. 
 - Добавлен файл terraform.tfvars.example в котором указаны переменные для образца

### Задание со *

 - Описано в коде main.tf добавление ключей для пользователя appuser1
 - Описано добавление в коде для нескольких пользователей в метаданные проекта
 - При добавлении ключа через веб интерфейс, после применения terraform apply ключ перезаписывается тем, что указан в terraform


## Terraform-2 project HW # 7

 - Инфраструктура разделена на модули для реализации принципа DRY. Протестирована работа. 
 - Созданы stage и prod
 - Продключен модуль bucket из реестра модулей

## Ansible-1 HW # 8

 - Создан inventory.yml
 - Протестирована работа playbook clone.yml и модуля git

## Ansible-2 HW # 9

 - Вынесена конфигурация приложения и конфигурация бд в отдельные сценарии
 - Созданы отдельные плейбуки для каждого инстанса app.yml, db.yml и для деплоя приложения deploy.yml
 - Создан один плейбук site.yml для всего проекта
 - Настроен провиженинг в packer образ при помощи ansible ( иправлены проблемы при помощи ` "user": "appuser" `)







