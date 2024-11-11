#!/bin/bash

# Definir variables de archivo y directorio
NETPLAN_FILE="/etc/netplan/50-cloud-init.yaml"
LOCAL_NETPLAN_FILE="./50-cloud-init.yaml"
MULTIPATH_SCRIPT="./multipath.sh"
NGINX_INSTALL_SCRIPT="./instalar_nginx.sh"
INDEX_UPDATE_SCRIPT="./actualizar_index.sh"
IMAGE_FILE="./Telecom_SummIT_1080x1080.jpg"
TARGET_IMAGE_PATH="/var/www/html/Telecom_SummIT_1080x1080.jpg"

# Asegurarse de que el archivo local de configuración de netplan existe
if [ ! -f "$LOCAL_NETPLAN_FILE" ]; then
    echo "El archivo $LOCAL_NETPLAN_FILE no existe. Por favor, verifica."
    exit 1
fi

# Reemplazar el contenido de /etc/netplan/50-cloud-init.yaml con el archivo local
echo "Reemplazando el contenido de $NETPLAN_FILE..."
sudo cp "$LOCAL_NETPLAN_FILE" "$NETPLAN_FILE"

# Cambiar permisos y ejecutar multipath.sh
echo "Cambiando permisos de $MULTIPATH_SCRIPT y ejecutándolo..."
sudo chmod 750 "$MULTIPATH_SCRIPT"
./"$MULTIPATH_SCRIPT"

# Cambiar permisos y ejecutar instalar_nginx.sh como sudo
echo "Cambiando permisos de $NGINX_INSTALL_SCRIPT y ejecutándolo como sudo..."
sudo chmod 750 "$NGINX_INSTALL_SCRIPT"
sudo ./"$NGINX_INSTALL_SCRIPT"

# Cambiar permisos y ejecutar actualizar_index.sh como sudo
echo "Cambiando permisos de $INDEX_UPDATE_SCRIPT y ejecutándolo como sudo..."
sudo chmod 750 "$INDEX_UPDATE_SCRIPT"
sudo ./"$INDEX_UPDATE_SCRIPT"

# Copiar la imagen a /var/www/html/
echo "Copiando $IMAGE_FILE a $TARGET_IMAGE_PATH..."
sudo cp "$IMAGE_FILE" "$TARGET_IMAGE_PATH"

# Confirmación de finalización
echo "El script ha finalizado todas las tareas."