{{/*
Expand the name of the chart.
*/}}
{{- define "minecraft-server.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
*/}}
{{- define "minecraft-server.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "minecraft-server.labels" -}}
helm.sh/chart: {{ include "minecraft-server.name" . }}
{{ include "minecraft-server.selectorLabels" . }}
app.kubernetes.io/version: {{ .Values.minecraft.version | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "minecraft-server.selectorLabels" -}}
app.kubernetes.io/name: {{ include "minecraft-server.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
