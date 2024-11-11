#!/bin/bash

# Evitar prompts interactivos durante la instalación
export DEBIAN_FRONTEND=noninteractive

# Actualizar lista de paquetes
echo "Actualizando lista de paquetes..."
sudo apt update

# Instalar Nginx sin prompts
echo "Instalando Nginx..."
sudo apt install -y nginx

# Iniciar Nginx
echo "Iniciando Nginx..."
sudo systemctl start nginx

# Habilitar Nginx para que inicie al arrancar el sistema
echo "Habilitando Nginx para que inicie automáticamente..."
sudo systemctl enable nginx

# Confirmar que Nginx está activo
echo "Verificando el estado de Nginx..."
sudo systemctl status nginx | grep "active (running)"

# Confirmar la instalación
if [ $? -eq 0 ]; then
    echo "Nginx se ha instalado y configurado correctamente."
else
    echo "Hubo un problema al instalar Nginx."
fi