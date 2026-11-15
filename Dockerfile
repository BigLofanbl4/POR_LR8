FROM alpine:3 AS build
WORKDIR /out
COPY site/ ./
RUN test -s index.html

FROM nginx:alpine
COPY --from=build /out/ /usr/share/nginx/html/
