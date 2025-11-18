{{/*
Генерирует стандартные лейблы для чарта.
*/}}
{{- define "spring-boot-app.labels" -}}
helm.sh/chart: {{ include "spring-boot-app.name" . }}
{{ include "spring-boot-app.selectorLabels" . }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Генерирует селекторные лейблы.
*/}}
{{- define "spring-boot-app.selectorLabels" -}}
app.kubernetes.io/name: {{ .Values.nameOverride }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{/*
Генерирует имя для ServiceAccount.
*/}}
{{- define "spring-boot-app.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (include "spring-boot-app.fullname" .) .Values.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}