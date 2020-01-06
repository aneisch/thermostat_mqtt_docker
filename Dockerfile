FROM alpine:latest

RUN sed -i 's/http\:\/\/dl-cdn.alpinelinux.org/https\:\/\/alpine.global.ssl.fastly.net/g' /etc/apk/repositories

RUN apk add --update \
    mosquitto-clients openssl curl bash

COPY ./thermostat_mqtt.sh /usr/bin/thermostat_mqtt.sh

RUN chmod +x /usr/bin/thermostat_mqtt.sh

RUN echo '*  *  *  *  *  /usr/bin/thermostat_mqtt.sh' > /etc/crontabs/thermostat_mqtt

RUN adduser -D thermostat_mqtt

ENV MQTT_SERVER 127.0.0.1
ENV MQTT_PORT 1883
ENV TOPIC sensor/thermostat
ENV THERMOSTAT_IP 127.0.0.1

CMD crond -l 2 -f
