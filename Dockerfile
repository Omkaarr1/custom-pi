FROM node:22-bookworm

RUN apt-get update && \
    apt-get install -y \
        git \
        openssh-client \
        curl \
        build-essential \
        python3 \
        sudo && \
    rm -rf /var/lib/apt/lists/*

RUN npm install -g @jmfederico/pi-web --allow-scripts=node-pty

# Use the existing UID 1000 user in the Node image
RUN usermod -l omkar node && \
    groupmod -n omkar node && \
    usermod -d /home/omkar -m omkar

USER omkar

WORKDIR /home/omkar

EXPOSE 8504

CMD ["pi-web", "start"]
