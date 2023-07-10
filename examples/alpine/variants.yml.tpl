variants:
{{- range .images }}
  - image:
      name: {{ $.from_image }}
      tag: {{ .tag }}
    source:
      name: {{ $.from_image }}
      tag: {{ .tag | quote }}
    variables:
      {{ if eq .tag "edge" }}
      {{ range $key, $value := $.edge_variables }}
      {{ $key }}: {{ $value }}
      {{ end }}
      {{ else }}
      {{ range $key, $value := $.default_variables }}
      {{ $key }}: {{ $value }}
      {{ end }}
      {{ end }}
{{- end }}