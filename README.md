# Installation

## Gravity K8s CI/CD Agent

1. `helm repo add gravity https://gravitycloudai.github.io/helm/`
2. `helm repo update`
3. `helm install gravity-ci-cd-agent gravity/gravity-ci-cd-agent -namespace gravity-cloud -f values.yaml`

## Gravity Wave

1. `helm repo add gravity https://gravitycloudai.github.io/helm/`
2. `helm repo update`
3. `helm install gravity-wave gravity/gravity-wave -namespace gravity-cloud -f values.yaml`

