# Installation

## Gravity K8s CI/CD Agent

1. `helm repo add gravity https://gravitycloudai.github.io/helm`
2. `helm repo update`
3. `helm upgrade --install gravity-ci-cd-agent gravity/gravity-ci-cd-agent -f values.yaml -n gravity-cloud --create-namespace`

## Gravity Wave

1. `helm repo add gravity https://gravitycloudai.github.io/helm`
2. `helm repo update`
3. `helm upgrade --install gravity-wave gravity/gravity-wave -f wave-val.yaml -n gravity-cloud --create-namespace`
