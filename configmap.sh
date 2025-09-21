kubectl create configmap apache-webpage \
  --from-file=index.php=./web/index.php \
  -o yaml --dry-run=client > ./configmap/apache-webpage.yml