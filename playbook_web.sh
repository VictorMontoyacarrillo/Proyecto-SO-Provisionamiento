#!/bin/bash
echo "=== Instalando servidor web Nginx ==="
sudo apt update -y
sudo apt install -y nginx

echo "=== Copiando archivos del sitio web ==="
sudo cp /vagrant/index.html /var/www/html/index.html
sudo cp /vagrant/logo.png /var/www/html/logo.png

echo "=== Ajustando permisos ==="
sudo chmod 644 /var/www/html/*

echo "=== Reiniciando Nginx ==="
sudo systemctl restart nginx
