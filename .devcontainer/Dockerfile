# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.134.0/containers/python-3/.devcontainer/base.Dockerfile
FROM mcr.microsoft.com/vscode/devcontainers/python:3.9
ARG USERNAME=vscode

RUN SNIPPET="export PROMPT_COMMAND='history -a' && export HISTFILE=/commandhistory/.bash_history" \
   && mkdir -p /home/$USERNAME/.vscode-server/extensions \
            /home/$USERNAME/.cache/pre-commit/ \
            /home/$USERNAME/.cache/helm \
            /commandhistory \
    && chown -R $USERNAME \
        /home/$USERNAME/.vscode-server \
        /home/$USERNAME/.cache \
        /commandhistory \
    && echo $SNIPPET >> "/home/$USERNAME/.bashrc"
        
# Access your local Docker install from inside a dev container. Installs Docker extension in the container along with needed CLIs.
# https://github.com/microsoft/vscode-dev-containers/tree/master/containers/docker-from-docker
COPY .devcontainer/library-scripts/docker-debian.sh /tmp/library-scripts/
RUN apt-get update && bash /tmp/library-scripts/docker-debian.sh
ENTRYPOINT ["/usr/local/share/docker-init.sh"]
CMD ["sleep", "infinity"]

# Install packages and ensure compatability of zsh with bash
RUN apt-get update && apt-get install -y wget unzip apt-transport-https ca-certificates curl bash-completion \
    && rm -rf /var/lib/apt/lists/* \
    && echo "autoload -Uz compinit && compinit" >> /etc/zsh/zshrc \
    && echo "autoload -Uz bashcompinit && bashcompinit" >> /etc/zsh/zshrc

# Updaye SHELL to enable substitutions of ENVs
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN wget --quiet https://github.com/npryce/adr-tools/archive/refs/tags/3.0.0.tar.gz \
  && tar -xvf 3.0.0.tar.gz \
  && rm -rf 3.0.0.tar.gz

ENV GOLANG_VERSION=go1.17.6
RUN curl -L "https://go.dev/dl/${GOLANG_VERSION}.linux-amd64.tar.gz" -o /tmp/${GOLANG_VERSION}.tar.gz \
  && rm -rf /usr/local/go && tar -C /usr/local -xzf /tmp/${GOLANG_VERSION}.tar.gz

ENV KUBERNETES_VERSION=v1.23.1
RUN curl -L https://storage.googleapis.com/kubernetes-release/release/${KUBERNETES_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
  && chmod +x /usr/local/bin/kubectl \
  && kubectl completion zsh >> /etc/zsh/zshrc

ENV HELM_VERSION=v3.7.2
RUN curl -L https://get.helm.sh/helm-${HELM_VERSION}-linux-amd64.tar.gz -o /tmp/helm_${HELM_VERSION}.tar.gz \
  && tar -xvf /tmp/helm_${HELM_VERSION}.tar.gz \
  && rm -rf /tmp/helm_${HELM_VERSION}.tar.gz \
  && mv linux-amd64/helm /usr/local/bin

ENV TERRAFORM_VERSION=v1.1.5
RUN curl -L https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION:1}/terraform_${TERRAFORM_VERSION:1}_linux_amd64.zip -o /tmp/tf_${TERRAFORM_VERSION}.zip \
  && unzip /tmp/tf_${TERRAFORM_VERSION}.zip \
  && rm -rf /tmp/tf_${TERRAFORM_VERSION}.zip \
  && mv terraform /usr/local/bin \
  && echo "complete -C '/usr/local/bin/terraform' terraform" >> /etc/zsh/zshrc

ENV AZURECLI_VERSION=2.32.0
COPY requirements.txt /tmp
RUN pip install pip --upgrade \
    && pip install azure-cli==${AZURECLI_VERSION} \
    && curl "https://raw.githubusercontent.com/Azure/azure-cli/dev/az.completion" >> /etc/zsh/zshrc \
    && pip install -r /tmp/requirements.txt
