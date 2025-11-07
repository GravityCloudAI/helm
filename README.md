# Installation

## Matter AI Enterprise

1. `helm repo add matterai https://matteraiorg.github.io/helm`
2. `helm repo update`
3. `helm upgrade --install matter-ai-enterprise matterai/matter-ai-enterprise -f matter-enterprise-values.yaml -n matterai --create-namespace`

## Matter AI MCP Configuration

The Matter AI MCP component is disabled by default. To enable it, set `matterMCP.enabled` to `true` in your values file:

```yaml
matterMCP:
  enabled: true
```

### Deployment Configuration

The MCP deployment uses the `gravitycloud/matter-ai-mcp` image with the following default settings:
- 1 replica
- Image tag: latest
- Resource requests: 256Mi memory, 250m CPU
- Resource limits: 512Mi memory, 500m CPU

You can customize these settings in your values file:

```yaml
matterMCP:
  enabled: true
  deployment:
    replicas: 2
    image:
      repository: gravitycloud/matter-ai-mcp
      tag: v1.0.0
    resources:
      requests:
        memory: "512Mi"
        cpu: "500m"
      limits:
        memory: "1Gi"
        cpu: "1000m"
```

The MCP service will automatically connect to the Matter Backend service through a dynamically constructed endpoint. The `MATTER_API_ENDPOINT` environment variable is automatically set to `http://matter-backend-service.matterai.svc.cluster.local:8080` (or the appropriate service URL based on your configuration), so no manual configuration is required.

### Service Configuration

The MCP service is configured as a ClusterIP service on port 9000 by default:

```yaml
matterMCP:
  enabled: true
  service:
    name: matter-mcp-server-service
    type: ClusterIP
    port: 9000
    targetPort: 9000
```

### Ingress Configuration

To expose the MCP service externally, configure its ingress by setting `matterMCP.ingress.enabled` to `true`:

```yaml
matterMCP:
  enabled: true
  ingress:
    enabled: true
    className: "nginx"
    annotations:
      nginx.ingress.kubernetes.io/ssl-redirect: "true"
    hosts:
      - host: matterai-mcp.example.com
        paths:
          - path: /
            pathType: Prefix
    tls:
      - secretName: matterai-mcp-server-tls
        hosts:
          - matterai-mcp.example.com
```

### Additional Configuration

The MCP deployment uses a ConfigMap volume for runtime configuration:

```yaml
matterMCP:
  enabled: true
  deployment:
    volumes:
      - name: runtime-config
        configMap:
          name: matter-ai-mcp-config
```

This ConfigMap is automatically created when the MCP component is enabled.
