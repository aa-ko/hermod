FROM node:22-alpine3.18 as build

COPY . /svelte
WORKDIR /svelte

RUN npm install
RUN npm run build

FROM caddy:2.7-alpine as prod

COPY --from=build /svelte/build /app
COPY Caddyfile /app/Caddyfile
WORKDIR /app

CMD [ "caddy", "run", "--config", "/app/Caddyfile" ]
