# crypt-manifest

[![CI](https://github.com/dekokun/crypt-manifest/actions/workflows/ci.yaml/badge.svg)](https://github.com/dekokun/crypt-manifest/actions/workflows/ci.yaml)

kubenetes manifests for Cryptocurrency full nodes

## build

```
$ helm dep build charts/argocd
$ helm upgrade --install --create-namespace argocd ./charts/argocd/ -n argocd
$ kubectl port-forward svc/argocd-server -n argocd 8080:80
$ argocd login localhost:8080
 user: admin
 password: $(kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo)
$ argocd app sync -l argocd.argoproj.io/instance=argocd
```

## how to make secret

```
vi ./mackerel-container-agent/mackerel-config-template
$ kubectl create secret generic mackerel --dry-run=client --from-file=config=./mackerel-container-agent/mackerel-config-template --from-literal=apikey=<your mackerel api key> -o json -n bitcoin \
| kubeseal --controller-name=system-sealed-secrets -o yaml --scope cluster-wide > charts/bitcoin/templates/sealedsecret.yaml
```

## how to add new schema for kubefonform

argocd application example:
```
git clone https://github.com/yannh/kubeconform
./kubeconform/scripts/openapi2jsonschema.py https://raw.githubusercontent.com/argoproj/argo-cd/master/manifests/crds/application-crd.yaml
```
