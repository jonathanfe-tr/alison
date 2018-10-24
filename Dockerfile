FROM python:3.7-alpine3.7

ENV APP_DIR /app
RUN apk update && \
    apk add \
        python-dev \
        build-base \
        py-gevent && \
    rm -rf /var/cache/apk/* && \
    mkdir $APP_DIR

WORKDIR $APP_DIR
COPY . /$APP_DIR
RUN pip install .

RUN addgroup -g 1000 -S alison && \
    adduser -u 1000 -S alison -G alison
USER alison
#
EXPOSE 8888/tcp
EXPOSE 8888/udp

CMD ["alison","--tcp","--udp"]
