# crypt-manifest

## build

```
$ helm dep build charts/argocd
$ helm upgrade --install argocd ./argocd/ -n argocd
$ kubectl port-forward svc/argocd-server -n argocd 8080:80

access http://localhost:8080 and sync all apps.
```


