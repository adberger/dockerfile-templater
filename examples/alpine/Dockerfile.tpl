FROM {{ .source.name }}:{{ .source.tag }}

LABEL
  "maintainer"="{{ .variables.maintainer }}"

ENV LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8

RUN apk add --no-cache --virtual .timezone tzdata && \
      cp /usr/share/zoneinfo/Europe/Zurich /etc/localtime && \
      echo "Europe/Zurich" >  /etc/timezone && \
      apk del .timezone

RUN apk add --no-cache tini curl jq

{{- if eq .source.tag "edge" }}
{{ template "edge" . }}
{{- else }}
{{ template "default" . }}
{{- end }}
