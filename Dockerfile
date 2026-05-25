FROM alpine:latest
RUN apk add --no-cache curl bash unzip
RUN curl -L https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip -o v2ray.zip
RUN unzip v2ray.zip -d /v2ray && chmod +x /v2ray/v2ray
COPY config.json /v2ray/config.json
EXPOSE 10000
CMD ["/v2ray/v2ray", "run", "-config", "/v2ray/config.json"]
