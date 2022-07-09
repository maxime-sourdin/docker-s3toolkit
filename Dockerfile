FROM proxy-docker.sourdin.ovh/alpine:3
RUN  apk update && apk upgrade && apk --no-cache add python3 py3-pip groff ca-certificates gnupg tzdata less mailcap openssl \
    && wget -q -O kubectl https://storage.googleapis.com/kubernetes-release/release/v1.22.2/bin/linux/amd64/kubectl \
    && wget -q -O gomplate https://github.com/hairyhenderson/gomplate/releases/download/v3.10.0/gomplate_linux-amd64-slim \
    && chmod +x kubectl gomplate \
    && mv kubectl gomplate /usr/local/bin
RUN pip install --upgrade awscli s3cmd