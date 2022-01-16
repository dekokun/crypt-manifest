# crypt-manifest

## build

```
$ helm dep build charts/argocd
$ helm upgrade --install argocd ./argocd/ -n argocd
$ kubectl port-forward svc/argocd-server -n argocd 8080:80
$ argocd login localhost:8080
 user: admin
 password: $(kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo)
$ argocd app sync -l argocd.argoproj.io/instance=argocd
```

## how to make secret

```
$ echo -n <your mackerel api key> | kubectl create secret generic mackerel --dry-run=client --from-file=apikey=/dev/stdin -o json -n bitcoin kubeseal --controller-name=system-sealed-secrets -o yaml > charts/bitcoin/templates/sealedsecret.yaml
$ echo -n your mackerel api key \
| kubectl create secret generic mackerel --dry-run=client --from-file=apikey=/dev/stdin -o json -n bitcoin \
| kubeseal --controller-name=system-sealed-secrets -o yaml > charts/bitcoin/templates/sealedsecret.yaml
```
