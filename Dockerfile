FROM nginx:latest
COPY nginx.conf /etc/nginx/nginx.conf
ENV SHELL=/bin/bash
RUN apt-get update && apt-get install wget -y && apt-get install git -y
RUN mkdir /root/coder
RUN wget https://github.com/coder/code-server/releases/download/v4.1.0/code-server-4.1.0-linux-amd64.tar.gz -O - | tar -zx -C /root/coder/
RUN mv /root/coder/code-server-4.1.0-linux-amd64 /root/coder/code-server
COPY config.yaml /root/.config/code-server/config.yaml
RUN apt-get install openjdk-11-jdk -y
RUN curl https://download.java.net/openjdk/jdk8u41/ri/openjdk-8u41-b04-linux-x64-14_jan_2020.tar.gz | tar -zx -C /usr/lib/jvm/ && mv /usr/lib/jvm/java-se-8u41-ri /usr/lib/jvm/java-8-openjdk-amd64
RUN /root/coder/code-server/bin/code-server --install-extension ms-ceintl.vscode-language-pack-zh-hans
RUN /root/coder/code-server/bin/code-server --install-extension vscjava.vscode-java-pack
RUN /root/coder/code-server/bin/code-server --install-extension pivotal.vscode-boot-dev-pack
RUN /root/coder/code-server/bin/code-server --install-extension k--kato.intellij-idea-keybindings
RUN /root/coder/code-server/bin/code-server --install-extension gabrielbb.vscode-lombok
RUN /root/coder/code-server/bin/code-server --install-extension zhuangtongfa.material-theme
RUN /root/coder/code-server/bin/code-server --install-extension emmanuelbeziat.vscode-great-icons
RUN /root/coder/code-server/bin/code-server --install-extension redhat.vscode-xml
RUN /root/coder/code-server/bin/code-server --install-extension gabrielbb.vscode-lombok
RUN /root/coder/code-server/bin/code-server --install-extension gabrielbb.vscode-lombok
COPY user-settings.json /root/.local/share/code-server/User/settings.json
COPY machine-settings.json /root/.local/share/code-server/Machine/settings.json
COPY languagepacks.json /root/.local/share/code-server/languagepacks.json
COPY run.sh /root/run.sh
RUN chmod -R 777 /root/run.sh
CMD /root/run.sh
