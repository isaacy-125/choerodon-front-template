{{- define "service.labels.standard" -}}
choerodon.io/release: {{ .Release.Name | quote }}
{{- end -}}

{{- define "service.logging.deployment.label" -}}
choerodon.io/logs-parser: {{ .Values.logs.parser | quote }}
{{- end -}}

{{- define "service.monitoring.pod.annotations" -}}
choerodon.io/metrics-group: {{ .Values.metrics.group | quote }}
choerodon.io/metrics-path: {{ .Values.metrics.path | quote }}
{{- end -}}

{{/*
Return the appropriate apiVersion for deployment.
*/}}
{{- define "app.deployment.apiVersion" -}}
{{- if semverCompare "<1.9-0" .Capabilities.KubeVersion.GitVersion -}}
{{- print "apps/v1beta2" -}}
{{- else -}}
{{- print "apps/v1" -}}
{{- end -}}
{{- end -}}

{{/*
Return the appropriate apiVersion for ingress.
*/}}
{{- define "app.ingress.apiVersion" -}}
{{- if semverCompare "<1.14-0" .Capabilities.KubeVersion.GitVersion -}}
{{- print "extensions/v1beta1" -}}
{{- else -}}
{{- print "networking.k8s.io/v1beta1" -}}
{{- end -}}
{{- end -}}