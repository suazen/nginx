FROM nginx:latest
COPY nginx.conf /etc/nginx/nginx.conf
ENV SHELL=/bin/bash
RUN apt-get update && apt-get install wget -y
RUN mkdir /root/coder
RUN wget https://github.com/coder/code-server/releases/download/v4.1.0/code-server-4.1.0-linux-amd64.tar.gz -O - | tar -zx -C /root/coder/
RUN mv /root/coder/code-server-4.1.0-linux-amd64 /root/coder/code-server
COPY config.yaml /root/.config/code-server/config.yaml
RUN apt-get install openjdk-11-jdk -y
COPY java-8-openjdk-amd64 /usr/lib/jvm/java-8-openjdk-amd64
RUN /root/coder/code-server/bin/code-server --install-extension vscjava.vscode-java-pack
RUN /root/coder/code-server/bin/code-server --install-extension pivotal.vscode-boot-dev-pack
RUN /root/coder/code-server/bin/code-server --install-extension ms-ceintl.vscode-language-pack-zh-hans
RUN /root/coder/code-server/bin/code-server --install-extension k--kato.intellij-idea-keybindings
RUN /root/coder/code-server/bin/code-server --install-extension gabrielbb.vscode-lombok
RUN /root/coder/code-server/bin/code-server --install-extension zhuangtongfa.material-theme
RUN /root/coder/code-server/bin/code-server --install-extension emmanuelbeziat.vscode-great-icons
RUN /root/coder/code-server/bin/code-server --install-extension redhat.vscode-xml
RUN /root/coder/code-server/bin/code-server --install-extension gabrielbb.vscode-lombok
RUN /root/coder/code-server/bin/code-server --install-extension gabrielbb.vscode-lombok
COPY settings.json /root/.local/share/code-server/User/settings.json
COPY run.sh /root/run.sh
RUN chmod -R 777 /root/run.sh
CMD /root/run.sh
