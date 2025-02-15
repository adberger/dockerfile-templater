FROM golang:{{ .go_version }}

RUN apt-get update && apt-get upgrade -y

ENV CGO_ENABLED=0

WORKDIR ${GOPATH}/src/
COPY . . 

RUN go get -d -v
RUN go build -o /templater && chmod +x /templater

FROM {{ .from_image }}

COPY --from=0 /templater /usr/local/bin/templater

ENTRYPOINT ["templater"]
CMD ["-h"]