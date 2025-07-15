FROM nginx:alpine
RUN npx quartz build -o ./html
RUN ls
COPY ./html /usr/share/nginx/html