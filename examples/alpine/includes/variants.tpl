{{- define "default" -}}
RUN curl -o /usr/bin/confd \
         -SL https://github.com/kelseyhightower/confd/releases/download/v{{ .variables.confd_version }}/confd-{{ .variables.confd_version }}-linux-amd64 \
  && echo -n '{{ .variables.confd_sha }}  /usr/bin/confd' | sha256sum -c - \
  && chown root:root /usr/bin/confd \
  && chmod 0755 /usr/bin/confd \
  && mkdir -p /etc/confd/conf.d \
  && mkdir -p /etc/confd/templates

RUN curl -o /usr/bin/gosu \
         -SL https://github.com/tianon/gosu/releases/download/{{ .variables.gosu_version }}/gosu-amd64 \
  && echo -n '{{ .variables.gosu_sha }}  /usr/bin/gosu' | sha256sum -c - \
  && chown root:root /usr/bin/gosu \
  && chmod 0755 /usr/bin/gosu
{{- end -}}

{{- define "edge" -}}
RUN curl -o /usr/bin/confd \
         -SL https://github.com/kelseyhightower/confd/releases/download/v{{ .variables.confd_version }}/confd-{{ .variables.confd_version }}-linux-amd64 \
  && echo -n '{{ .variables.confd_sha }}  /usr/bin/confd' | sha256sum -c - \
  && chown root:root /usr/bin/confd \
  && chmod 0755 /usr/bin/confd \
  && mkdir -p /etc/confd/conf.d \
  && mkdir -p /etc/confd/templates

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
RUN apk add --no-cache gosu
{{- end -}}
