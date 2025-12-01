#!/bin/bash

echo "=== Instalando servidor web Nginx ==="
sudo apt update -y
sudo apt install -y nginx

echo "=== Copiando el index.html personalizado ==="
sudo cp /vagrant/index.html /var/www/html/index.html

echo "=== Reiniciando Nginx ==="
sudo systemctl restart nginx
