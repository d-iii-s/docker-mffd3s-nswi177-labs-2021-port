FROM alpine:3.13
MAINTAINER horky@d3s.mff.cuni.cz
LABEL maintainer="horky@d3s.mff.cuni.cz"

COPY entrypoint.sh /
RUN apk add nginx \
    && sed 's#return 404;#return 200 "6a16574470cb83952263e6b4d237894df76fb4281cb9ec5f54c8866020191c6f\n";#' -i /etc/nginx/http.d/default.conf \
    && mkdir /run/nginx/ \
    && chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 80

CMD ["default"]
