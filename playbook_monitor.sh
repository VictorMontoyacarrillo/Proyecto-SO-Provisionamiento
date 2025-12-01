#!/bin/bash

echo "=== Actualizando repositorios ==="
sudo apt-get update -y

echo "=== Instalando dependencias ==="
sudo apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release

echo "=== Agregando clave GPG de Docker ==="
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

echo "=== Agregando repositorio de Docker ==="
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) stable"

echo "=== Instalando Docker ==="
sudo apt-get update -y
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

echo "=== Agregando usuario vagrant al grupo docker ==="
sudo usermod -aG docker vagrant

echo "=== Instalando Docker Compose 1.29 ==="
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" \
    -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

echo "=== Copiando archivo prometheus.yml ==="
sudo mkdir -p /etc/prometheus
sudo cp /vagrant/prometheus.yml /etc/prometheus/prometheus.yml

echo "=== Descargando Prometheus con Docker ==="
sudo docker run -d \
  --name prometheus \
  -p 9090:9090 \
  -v /etc/prometheus/prometheus.yml:/etc/prometheus/prometheus.yml \
  prom/prometheus

echo "=== Prometheus instalado correctamente ==="
