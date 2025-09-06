# 🍯 Tienda de Mermeladas - Despliegue con Docker

> Página web de tienda de mermeladas artesanales en modo dark, desplegada con Docker en VPS.

## 📁 Estructura del Proyecto

```
mi-proyecto/
├── index.html          # Página web en modo dark
├── Dockerfile          # Configuración de contenedor
├── docker-compose.yml  # Orquestación de servicios
└── README.md          # Esta documentación
```

## 🚀 Pasos para Despliegue

### 1. **Crear la Página Web**
- ✅ Diseño elegante en modo dark (negro/gris)
- ✅ Responsive para móviles
- ✅ Secciones: Header, Hero, Características, Productos, Footer
- ✅ Temática: Tienda de mermeladas artesanales

### 2. **Configurar Docker**

**Dockerfile:**
```dockerfile
FROM nginx:alpine
LABEL maintainer="Tienda de Mermeladas"
COPY index.html /usr/share/nginx/html/
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
```

**docker-compose.yml:**
```yaml
version: '3.8'
services:
  web:
    build: .
    container_name: mermeladas-tienda
    ports:
      - "8080:80"  # Puerto 8080 para evitar conflictos
    restart: unless-stopped
    healthcheck:
      test: ["CMD", "wget", "--quiet", "--tries=1", "--spider", "http://localhost"]
      interval: 30s
```

### 3. **Subir a GitHub**
```bash
git init
git add .
git commit -m "Tienda mermeladas dark con Docker"
git push -u origin main
```

### 4. **Despliegue en VPS**

#### **Conectar al VPS:**
```bash
ssh -i archivo.pem usuario@ip-vps
```

#### **Instalar Docker:**
```bash
sudo apt update
sudo apt install docker.io docker-compose -y
sudo systemctl start docker
sudo systemctl enable docker
```

#### **Clonar y Ejecutar:**
```bash
git clone https://github.com/usuario/repositorio.git
cd repositorio
sudo docker-compose up -d --build
```

## 🛠️ Problemas Comunes y Soluciones

### **Error: Puerto 80 ocupado**
```bash
# Verificar qué usa el puerto 80
sudo lsof -i :80

# Solución: Cambiar a puerto 8080 en docker-compose.yml
ports:
  - "8080:80"
```

### **Error: ContainerConfig**
```bash
# Limpiar contenedores antiguos
sudo docker-compose down
sudo docker container prune -f
sudo docker image prune -f
```

### **Verificar funcionamiento**
```bash
# Ver contenedores corriendo
sudo docker ps

# Ver logs si hay errores
sudo docker-compose logs
```

## 🌐 Acceso a la Aplicación

Una vez desplegada, acceder en:
```
http://tu-ip-vps:8080
```

## 🔄 Actualizaciones

Para actualizar la aplicación:

```bash
# En el VPS
git pull
sudo docker-compose up -d --build
```

## 📊 Estado del Contenedor

**Contenedor funcionando correctamente:**
```bash
CONTAINER ID   IMAGE             COMMAND                  CREATED          STATUS                    PORTS                    NAMES
3c2a9ec6dc94   conexionvps_web   "/docker-entrypoint.…"   45 seconds ago   Up 44 seconds (healthy)   0.0.0.0:8080->80/tcp    mermeladas-tienda
```

## 🎯 Características del Proyecto

- **Frontend:** HTML5 + CSS3 puro
- **Servidor:** Nginx Alpine (ultra-ligero)
- **Containerización:** Docker + Docker Compose
- **Versionado:** Git + GitHub
- **Despliegue:** VPS con SSH
- **Puerto:** 8080 (para evitar conflictos)
- **Monitoreo:** Healthcheck integrado

## 🎨 Diseño

- **Paleta:** Modo dark elegante
- **Colores:** Negro (#000000), grises (#111111, #1a1a1a, #2d2d2d)
- **Tipografía:** Georgia serif
- **Efectos:** Hover y transiciones suaves
- **Responsive:** Adaptable a móviles

## 📝 Comandos Útiles

```bash
# Ver logs en tiempo real
sudo docker-compose logs -f

# Reiniciar servicios
sudo docker-compose restart

# Detener servicios
sudo docker-compose down

# Verificar salud del contenedor
sudo docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"
```

## 🏆 Resultado Final

✅ **Página web funcionando**  
✅ **Contenedor saludable**  
✅ **Accesible desde internet**  
✅ **Actualizaciones automáticas**  

---

**🍯 ¡Tu tienda de mermeladas artesanales ya está online!** 🌟
