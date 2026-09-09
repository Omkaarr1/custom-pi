FROM node:22-bookworm

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        git \
        openssh-client \
        curl \
        build-essential \
        python3 \
        sudo && \
    rm -rf /var/lib/apt/lists/*

RUN npm install -g @jmfederico/pi-web --allow-scripts=node-pty

ENV HOME=/home/omkar
ENV PI_WEB_HOST=0.0.0.0
ENV PI_WEB_PORT=8504

WORKDIR /home/omkar

USER node

EXPOSE 8504

CMD ["sh", "-c", "pi-web-sessiond & exec pi-web-server"]
