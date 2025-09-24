FROM alpine:latest

RUN apk update && apk add --no-cache \
    openssh \
    curl 
    
RUN curl -L https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64 -o /usr/bin/cloudflared && \
    chmod +x /usr/bin/cloudflared

RUN mkdir /root/.ssh

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
