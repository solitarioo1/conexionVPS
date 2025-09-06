# Usar imagen base de Nginx ligera
FROM nginx:alpine

# Metadata del proyecto
LABEL maintainer="Tienda de Mermeladas"
LABEL description="Página web de tienda de mermeladas artesanales en modo dark"
LABEL version="1.0"

# Copiar el archivo HTML al directorio de Nginx
COPY index.html /usr/share/nginx/html/

# Crear configuración personalizada de Nginx (opcional)
# COPY nginx.conf /etc/nginx/nginx.conf

# Exponer puerto 80
EXPOSE 80

# Comando por defecto (ya incluido en nginx:alpine)
CMD ["nginx", "-g", "daemon off;"]