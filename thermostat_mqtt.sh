#!/bin/bash

message=$(curl -m 40 -s http://$THERMOSTAT_IP/tstat)

if [[ $message == *-1* ]]
  then
    exit 1
elif [[ $message == "" ]]
  then
    exit 1
fi

message_fixed=$(echo $message | sed -e 's/t_heat/setpoint/' -e 's/t_cool/setpoint/')

mosquitto_pub -h $MQTT_SERVER -p $MQTT_PORT -t $TOPIC -m $message_fixed
