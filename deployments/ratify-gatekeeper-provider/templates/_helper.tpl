{{/*
Check if the TLS certificates are provided by the user
*/}}
{{- define "ratify.tlsCertsProvided" -}}
{{- if and .Values.provider.tls.crt .Values.provider.tls.key .Values.provider.tls.cabundle .Values.provider.tls.caCert .Values.provider.tls.caKey -}}
true
{{- else -}}
false
{{- end -}}
{{- end -}}

{{/*
Choose the certificate/key pair to enable TLS for HTTP server
*/}}
{{- define "ratify.tlsSecret" -}}
{{- if eq (include "ratify.tlsCertsProvided" .) "true" }}
tls.crt: {{ .Values.provider.tls.crt | b64enc | quote }}  
tls.key: {{ .Values.provider.tls.key | b64enc | quote }}
ca.crt: {{ .Values.provider.tls.caCert | b64enc | quote }}
ca.key: {{ .Values.provider.tls.caKey | b64enc | quote }}
{{- end }}
{{- end }}