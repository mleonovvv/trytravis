# mleonovvv_infra
mleonovvv Infra repository

### Homework-4. cloud-bastion

Реквизиты для подключения к bastion
```
bastion_IP = 35.204.29.223
someinternalhost_IP = 10.142.0.2
```
#### Подключение к someinternalhost в одну строку
Настроить SSH Forwarding на вашей локальной машине:
`ssh-add -L`

Добавить приватный ключ в ssh агент авторизации:
`ssh-add ~/.ssh/id_rsa.pub`

Выполнить команду:
`ssh -o ProxyCommand='ssh bastion_ip -W %h:%p' someinternalhost_ip`

#### Подключение к someinternalhost через алиас командой `ssh someinternalhost`
Добавить в файл:
`~/.ssh/config`
конфигурацию подключения:
```
Host someinternalhost
  User ssh_пользовавтель
  Port someinternalhost_порт
  HostName someinternalhost_IP
  ProxyCommand ssh bastion_IP nc %h %p
```
Выполнить команду: `ssh someinternalhost`

### Homework-5. cloud-testapp

#### Реквизиты подключения:
```
testapp_IP = 35.204.4.33
testapp_port = 9292 
```

#### Комманда для запуска инстанса со startup-script:
`gcloud compute instances create reddit-app --boot-disk-size=10GB --image-family ubuntu-1604-lts --image-project=ubuntu-os-cloud --machine-type=g1-small --tags puma-server --restart-on-failure --metadata-from-file startup-script=kickstart.sh`

#### Комманда для создания правила брандмауэра
`gcloud compute firewall-rules create default-puma-server --allow=tcp:9292 --source-ranges=0.0.0.0/0 --target-tags=puma-server`

### Homework-7. terraform-1

Создано описание создания ВМ экземпляра base-app и правило firewall

### Homework-9. ansible-1

При повторном выполнении команды `git` была сохранена идемпотентность и измненений не произошло в виду наличия актуального клона репозитория. После удаления репозитория и выполнения плейбука заного произошли изменения.
