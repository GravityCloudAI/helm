{{/*
Common labels
*/}}
{{- define "gravity.labels" -}}
app.kubernetes.io/managed-by: {{ .Release.Service }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
{{- if .Values.commonLabels }}
{{ toYaml .Values.commonLabels }}
{{- end }}
{{- end }}

{{/*
Create the image pull credentials
Supports both username/password and direct auth token
*/}}
{{- define "imagePullSecret" }}
{{- with . }}
{{- if .auth }}
{{- printf "{\"auths\":{\"%s\":{\"auth\":\"%s\"}}}" .registry .auth | b64enc }}
{{- else }}
{{- printf "{\"auths\":{\"%s\":{\"username\":\"%s\",\"password\":\"%s\",\"email\":\"%s\",\"auth\":\"%s\"}}}" .registry .username .password .email (printf "%s:%s" .username .password | b64enc) | b64enc }}
{{- end }}
{{- end }}
{{- end }}