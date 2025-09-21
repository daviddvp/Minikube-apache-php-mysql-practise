# Proyecto Minikube: Apache + PHP + MySQL

## 🎯 Objetivo
Crear un entorno Kubernetes completo en **Minikube** que simule un escenario real de desarrollo o pruebas, con:

- Servidor web Apache con PHP.
- Base de datos MySQL.
- Variables sensibles gestionadas con **Secrets**.
- Código web gestionado con **ConfigMap**.
- Persistencia de datos con **PersistentVolumeClaim (PVC)**.

---

## 🔹 Componentes principales

1. **MySQL Deployment**
   - Imagen: `mysql:8.0`
   - Variables sensibles desde Secret
   - Base de datos `appdb`
   - Persistencia de datos con PVC

2. **MySQL Service**
   - Tipo: `ClusterIP`
   - Permite acceso interno a otros pods (Apache)

3. **Apache Deployment + PHP**
   - Imagen: `php:8.2-apache`
   - Monta ConfigMap con `index.php`
   - Variables de entorno apuntando a la base de datos

4. **Apache Service**
   - Tipo: `NodePort`
   - Acceso a la web desde navegador

5. **ConfigMap**
   - Contiene el `index.php` con código PHP
   - Montado como volumen dentro del contenedor Apache

6. **Secret**
   - Contiene usuario y contraseña de MySQL
   - Mantiene las credenciales fuera del Deployment

7. **PersistentVolumeClaim (PVC)**
   - Asegura que los datos de MySQL persistan aunque el pod se reinicie

---

## ⚡ Flujo de funcionamiento

1. Minikube levanta el cluster.
2. MySQL Deployment crea un pod con base de datos `appdb` y persiste datos en PVC.
3. Apache Deployment crea pods con PHP que sirven `index.php`.
4. `index.php` usa variables de entorno (desde Secret) para conectarse al Service de MySQL.
5. Apache Service NodePort permite abrir la web de prueba en el navegador.
6. ConfigMap asegura que el contenido web esté separado del Deployment.

---

## 🛠 Comandos clave de despliegue

```bash
# Iniciar Minikube
minikube start

# Crear Secret
kubectl apply -f secrets/mysql-secret.yml

# Crear PVC
kubectl apply -f pvc/mysql-pvc.yml

# Desplegar MySQL
kubectl apply -f deployments/mysql-deployment.yml

# Crear MySQL Service
kubectl apply -f services/mysql-service.yml

# Crear ConfigMap con index.php
kubectl apply -f configmap/apache-webpage.yml

# Desplegar Apache + PHP
kubectl apply -f deployments/apache-deployment.yml

# Crear Apache Service
kubectl apply -f services/apache-service.yml

# Abrir la web de prueba
minikube service apache-bbd-service



