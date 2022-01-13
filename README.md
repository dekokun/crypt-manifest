# crypt-manifest

helm upgrade --install metrics-server metrics-server/metrics-server
helm upgrade --install clusterrole ./clusterrole/
helm upgrade --install bitcoin ./bitcoin/ -n bitcoin --create-namespace
