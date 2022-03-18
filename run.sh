#!/bin/bash
nohup /root/coder/code-server/code-server --port 1080 --host 0.0.0.0 --auth password >/dev/null 2>&1 &
nginx -g "daemon off;"
