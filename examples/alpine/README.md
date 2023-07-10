# How-To

- go build .
- old way: `./dockerfile-templating -dockerfile.sep "-" -dockerfile.tpl examples/alpine/Dockerfile.tpl -dockerfile.tpldir examples/alpine/includes/ -variants examples/alpine/variants.yml`
- new way: `./dockerfile-templating -dockerfile.sep "-" -dockerfile.tpl examples/alpine/Dockerfile.tpl -dockerfile.tpldir examples/alpine/includes/ -variants examples/alpine/variants.yml.tpl -variants.cfg examples/alpine/variants-conf.yml`