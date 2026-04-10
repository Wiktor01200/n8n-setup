FROM n8nio/n8n:latest
USER root

# Reinstall apk tools (removed in hardened images)
RUN wget https://gitlab.alpinelinux.org/api/v4/projects/5/packages/generic/v2.14.4/x86_64/apk.static && \
    chmod +x apk.static && \
    ./apk.static -X http://dl-cdn.alpinelinux.org/alpine/v3.22/main -U --allow-untrusted --initdb add apk-tools

# Now install Python 3
RUN apk add --no-cache python3 py3-pip

USER node