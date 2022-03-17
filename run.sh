#!/bin/bash
nohup /home/coder/code-server/code-server >/dev/null 2>&1 &
nginx -g "daemon off;"
