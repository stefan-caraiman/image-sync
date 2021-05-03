FROM alpine:3.13

RUN apk --update add --no-cache skopeo ca-certificates bash curl

RUN wget $(curl -s https://api.github.com/repos/mikefarah/yq/releases/latest | grep browser_download_url | grep linux_amd64 | cut -d '"' -f 4) -O /usr/local/bin/yq && chmod +x /usr/local/bin/*

COPY root/ /

RUN chmod +x /usr/local/bin/* && chmod +x /usr/bin/*

ENTRYPOINT [ "/usr/local/bin/image-sync" ]
