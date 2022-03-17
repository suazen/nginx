FROM nginx:latest
COPY nginx.conf /etc/nginx/nginx.conf
ENV SHELL=/bin/bash
RUN apt-get update && apt-get install wget -y
RUN mkdir /home/coder
RUN curl https://objects.githubusercontent.com/github-production-release-asset-2e65be/172953845/553ffadf-408b-469c-b369-a7b503850a20?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20220317%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20220317T181828Z&X-Amz-Expires=300&X-Amz-Signature=31d1fed7a1f31223c5859ddc4def77cb03d95d725d0242b82d2f8a36b96b1222&X-Amz-SignedHeaders=host&actor_id=29150522&key_id=0&repo_id=172953845&response-content-disposition=attachment%3B%20filename%3Dcode-server-4.1.0-linux-amd64.tar.gz&response-content-type=application%2Foctet-stream | tar -zx -C /home/coder/
RUN mv /home/coder/code-server-4.1.0-linux-amd64 /home/coder/code-server
RUN export PASSWORD="suazen9689"
CMD nohup /home/coder/code-server/code-server --port 8080 --host 0.0.0.0 --auth password >/dev/null 2>&1 &
