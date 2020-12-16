# Temp Build environment
FROM node:12.8.0 as builder
WORKDIR /app
COPY ./build /app/build

# Production environment
FROM nginx:1.16.0-alpine
COPY --from=builder /app/build /usr/share/nginx/html
RUN rm -rf /etc/nginx/conf.d
COPY conf /etc/nginx
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]