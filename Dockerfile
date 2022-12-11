FROM proxy-docker.sourdin.ovh/alpine:3.17.0
ENV TERRAFORM_VERSION 1.3.6
RUN  apk update && apk upgrade && apk --no-cache add python3 py3-pip groff ca-certificates gnupg tzdata less mailcap openssl \
    && wget -q -O kubectl https://storage.googleapis.com/kubernetes-release/release/v1.25.4/bin/linux/amd64/kubectl \
    && wget -q -O gomplate https://github.com/hairyhenderson/gomplate/releases/download/v3.11.3/gomplate_linux-amd64-slim \
    && wget -q -O terraform_${TERRAFORM_VERSION}_linux_amd64.zip https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    && unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip \ 
    && rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip \ 
    && chmod +x kubectl gomplate terraform \
    && mv kubectl gomplate terraform /usr/local/bin    
RUN pip install --upgrade awscli s3cmd
