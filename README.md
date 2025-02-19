# Installation

## Gravity K8s CI/CD Agent

1. `helm repo add gravity https://gravitycloudai.github.io/helm`
2. `helm repo update`
3. `helm upgrade --install gravity-ci-cd-agent gravity/gravity-ci-cd-agent -f values.yaml -n gravity-cloud --create-namespace`

## Matter AI Code Review Agent

1. `helm repo add gravity https://gravitycloudai.github.io/helm`
2. `helm repo update`
3. `helm upgrade --install matter-ai gravity/gravity-matter -f matter-values.yaml -n matter-ai --create-namespace`
