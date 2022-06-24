# Stage 1
FROM node:18-alpine3.14 as build-step

RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh nano zopfli brotli 

RUN npm i -g pnpm
    
COPY package.json .
COPY pnpm-lock.yaml .

RUN pnpm install

COPY . .

RUN pnpm run build
    
# COPY /dist /usr/share/nginx/html



RUN find dist -type f -regex '.*[css|csv|html|js|svg|txt|xml|json]' -exec zopfli '{}' \;

RUN find dist -type f -regex '.*[css|csv|html|js|svg|txt|xml|json]' -exec brotli '{}' \;


#Stage 2
# https://github.com/fholzer/docker-nginx-brotli
FROM fholzer/nginx-brotli:v1.21.6 

COPY --from=build-step /dist /usr/share/nginx/html

COPY nginx.vh.default.conf /etc/nginx/conf.d/default.conf

# RUN mv -v dist/* /usr/share/nginx/html



EXPOSE 80
