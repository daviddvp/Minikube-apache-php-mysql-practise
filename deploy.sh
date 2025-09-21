#!/bin/bash

# sudo sh configmap.sh

# 1️⃣ Secret de MySQL
kubectl apply -f secrets/mysql-secret.yml

# 2️⃣ PVC de MySQL
kubectl apply -f pvc/mysql-pvc.yml

# 3️⃣ Deployment de MySQL
kubectl apply -f deployments/mysql-deployment.yml

# 4️⃣ Service de MySQL
kubectl apply -f services/mysql-service.yml

# 5️⃣ ConfigMap con index.html
kubectl apply -f configmap/apache-webpage.yml

# 6️⃣ Deployment de Apache
kubectl apply -f deployments/apache-deployment.yml

# 7️⃣ Service de Apache (NodePort)
kubectl apply -f services/apache-service.yml
