#### 1.Установите Bitwarden плагин для браузера. Зарегестрируйтесь и сохраните несколько паролей.

<em>Ответ:<em><br />

![drawing](result1.png)

#### 2.Установите Google authenticator на мобильный телефон. Настройте вход в Bitwarden акаунт через Google authenticator OTP.

<em>Ответ:<em><br />

![drawing](result2.png)

#### 3.Установите apache2, сгенерируйте самоподписанный сертификат, настройте тестовый сайт для работы по HTTPS.

<em>Ответ:<em><br />

![drawing](result3.png)

>Устанавливаем apache2<br>
`sudo apt-get update`<br>
`sudo apt install apache2`<br>

>включаем mod_ssl с помощью команды a2enmod:<br>
`sudo a2enmod ssl #включаем mod_ssl`

>Перезапуcкаем Apache, чтобы активировать модуль:<br>
`sudo systemctl restart apache2`<br>

>Создаем файлы ключей и сертификатов SSL с помощью команды openssl:<br>
>«\» само по себе в конце строки является средством объединения строк вместе.<br>

`sudo openssl req -x509 -nodes -days 36500 -newkey rsa:2048 \`<br>
`-keyout /etc/ssl/private/apache-selfsigned.key \`<br>
`-out /etc/ssl/certs/apache-selfsigned.crt \`<br>
`-subj "/C=RU/ST=Russia/L=Sakhalin/O=NetologyHW/OU=Org/CN=www.netologyHW.ru"`<br>

>генерировать конфиг файл можно на сайте https://ssl-config.mozilla.org<br>
`sudo nano /etc/apache2/sites-available/web1.conf`<br>

><VirtualHost *:443><br>
 ServerName web1<br>
 DocumentRoot /var/www/web1<br>
 SSLEngine on<br>
 SSLCertificateFile /etc/ssl/certs/apache-selfsigned.crt<br>
 SSLCertificateKeyFile /etc/ssl/private/apache-selfsigned.key<br>
\</VirtualHost><br>

`sudo mkdir /var/www/web1`<br>
`sudo nano /var/www/web1/index.html`<br>
>создаем, что будет отображатся на странице.<br>

<h1>My site on Apache2 working!</h1>

>Затем нам нужно включить файл конфигурации с помощью инструмента a2ensite:<br>
`sudo a2ensite web1.conf` <br>

>проверяем<br>
`sudo apache2ctl configtest`<br>
`sudo systemctl reload apache2`<br>

#### 4.Проверьте на TLS уязвимости произвольный сайт в интернете (кроме сайтов МВД, ФСБ, МинОбр, НацБанк, РосКосмос, РосАтом, РосНАНО и любых госкомпаний, объектов КИИ, ВПК ... и тому подобное).
<em>Ответ:<em><br />

![drawing](result4.png)

#### 5.Установите на Ubuntu ssh сервер, сгенерируйте новый приватный ключ. Скопируйте свой публичный ключ на другой сервер. Подключитесь к серверу по SSH-ключу.
<em>Ответ:<em><br />

![drawing](result5.png)

#### 6.Переименуйте файлы ключей из задания 5. Настройте файл конфигурации SSH клиента, так чтобы вход на удаленный сервер осуществлялся по имени сервера.
<em>Ответ:<em><br />

![drawing](result6.png)

#### 7.Соберите дамп трафика утилитой tcpdump в формате pcap, 100 пакетов. Откройте файл pcap в Wireshark.
<em>Ответ:<em><br />

`sudo tcpdump -c 100 -w 100.pcap -i enp0s8`<br>
>tcpdump: listening on enp0s8, link-type EN10MB (Ethernet), capture size 262144 bytes<br>
100 packets captured<br>
125 packets received by filter<br>
0 packets dropped by kernel<br>

`sudo apt install wireshark`<br>
`sudo wireshark`

![drawing](result7.png)