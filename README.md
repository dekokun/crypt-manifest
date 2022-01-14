# crypt-manifest

install [mozilla/sops: Simple and flexible tool for managing secrets](https://github.com/mozilla/sops)

```
$ helm plugin install https://github.com/jkroepke/helm-secrets --version v3.11.0
$ helm upgrade --install clusterrole ./clusterrole/
$ helm secrets view bitcoin/secret.yaml | kubectl apply -f -
$ helm upgrade --install bitcoin ./bitcoin/ -n bitcoin --create-namespace -f helm_vars/secrets.yaml
$ helm dep build argocd
$ helm upgrade --install argocd ./argocd/ -n argocd
$ helm dep build metrics-server
$ helm upgrade --install metrics-server ./metrics-server/ -n default
```


