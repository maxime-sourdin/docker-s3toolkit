FROM proxy-docker.sourdin.ovh/alpine:3.17.0
RUN  apk update && apk upgrade && apk --no-cache add python3 py3-pip groff ca-certificates gnupg tzdata less mailcap openssl \
    && wget -q -O kubectl https://storage.googleapis.com/kubernetes-release/release/v1.25.4/bin/linux/amd64/kubectl \
    && wget -q -O gomplate https://github.com/hairyhenderson/gomplate/releases/download/v3.11.3/gomplate_linux-amd64-slim \
    && chmod +x kubectl gomplate \
    && mv kubectl gomplate /usr/local/bin
RUN cd /usr/local/bin && \
    curl https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip -o terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip
RUN pip install --upgrade awscli s3cmd
