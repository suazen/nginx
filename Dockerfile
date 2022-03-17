FROM nginx:latest
COPY nginx.conf /etc/nginx/nginx.conf
ENV SHELL=/bin/bash
RUN apt-get update && apt-get install wget -y
RUN mkdir /home/coder
RUN wget https://github.com/coder/code-server/releases/download/v4.1.0/code-server-4.1.0-linux-amd64.tar.gz -O - | tar -zx -C /home/coder/
RUN mv /home/coder/code-server-4.1.0-linux-amd64 /home/coder/code-server
COPY config.yaml /root/.config/code-server/config.yaml
COPY run.sh /root/run.sh
RUN chmod -R 777 /root/run.sh
CMD /root/run.sh
