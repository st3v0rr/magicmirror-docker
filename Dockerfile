FROM node:22-buster

RUN set -e; \
    apt update; \
    apt install -y gettext; \
    rm -rf /var/lib/apt/lists/*

ENV NODE_ENV production
WORKDIR /opt/magicmirror

RUN git clone https://github.com/MichMich/MagicMirror.git .
RUN npm install --unsafe-perm --silent

COPY config.js /opt/magicmirror/config

EXPOSE 8080
CMD ["npm", "run", "server"]
