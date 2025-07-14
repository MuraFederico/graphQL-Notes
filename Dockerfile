FROM nginx:alpine
RUN npx quartz build -o ./html
COPY ./html /usr/share/nginx/html