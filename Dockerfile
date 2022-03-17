FROM nginx:latest
COPY nginx.conf /etc/nginx/nginx.conf
ENV SHELL=/bin/bash
RUN apt-get update && apt-get install wget -y
RUN mkdir /home/coder
RUN curl –compressed https://github.com/coder/code-server/releases/download/v4.1.0/code-server-4.1.0-linux-amd64.tar.gz | tar -xz -C /home/coder/
RUN mv /home/coder/code-server-4.1.0-linux-amd64 /home/coder/code-server
RUN export PASSWORD="suazen9689"
CMD nohup /home/coder/code-server/code-server --port 8080 --host 0.0.0.0 --auth password >/dev/null 2>&1 &
