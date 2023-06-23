FROM caddy:2.4.6-alpine

RUN mkdir -p /app
COPY public/ /app/web

COPY Caddyfile /app/Caddyfile

WORKDIR /app

CMD [ "caddy", "run", "-config", "/app/Caddyfile" ]