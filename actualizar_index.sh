#!/bin/bash

# Ruta al archivo de index de Nginx
INDEX_FILE="/var/www/html/index.nginx-debian.html"

# Contenido HTML que quieres añadir al archivo
HTML_CONTENT='<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Server Information</title>
    <style>
        /* Hacer que el fondo de pantalla ocupe toda la pantalla */
        body, html {
            height: 100%;
            margin: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            background-image: url("Telecom_SummIT_1080x1080.jpg");
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            font-family: Arial, sans-serif;
            color: white;
        }

        /* Posición del texto en la esquina inferior derecha */
    </style>
</head>
<body>
    <!-- Contenedor para mostrar el texto en la esquina inferior derecha -->
</body>
</html>'

# Borrar el contenido anterior y escribir el nuevo contenido en el archivo
echo "Escribiendo nuevo contenido en $INDEX_FILE..."
echo "$HTML_CONTENT" | sudo tee $INDEX_FILE > /dev/null

# Confirmación
if [ $? -eq 0 ]; then
    echo "El contenido de $INDEX_FILE ha sido actualizado exitosamente."
else
    echo "Hubo un problema al actualizar $INDEX_FILE."
fi