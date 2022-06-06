# https://github.com/fholzer/docker-nginx-brotli
FROM fholzer/nginx-brotli:v1.21.6 

RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh nano zopfli brotli 

RUN apk add --update nodejs npm

COPY . .

RUN npm install

RUN npm run build
    
# COPY /dist /usr/share/nginx/html

RUN mv -v dist/* /usr/share/nginx/html

RUN find /usr/share/nginx/html -type f -regex '.*[css|csv|html|js|svg|txt|xml|json]' -exec zopfli '{}' \;

RUN find /usr/share/nginx/html -type f -regex '.*[css|csv|html|js|svg|txt|xml|json]' -exec brotli '{}' \;

EXPOSE 80
