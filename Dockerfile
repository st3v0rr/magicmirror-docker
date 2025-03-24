FROM node:22-bookworm-slim

ENV NODE_ENV=production

WORKDIR /opt/magicmirror

RUN apt-get update && \
    apt-get install -y git gettext && \
    rm -rf /var/lib/apt/lists/*

RUN git clone --depth 1 https://github.com/MichMich/MagicMirror.git .

RUN npm ci --only=production && \
    npm cache clean --force

RUN groupadd -r magicmirror && \
    useradd -r -g magicmirror -d /opt/magicmirror magicmirror && \
    chown -R magicmirror:magicmirror /opt/magicmirror

COPY --chown=magicmirror:magicmirror config.js /opt/magicmirror/config/

USER magicmirror

EXPOSE 8080

CMD ["npm", "run", "server"]
