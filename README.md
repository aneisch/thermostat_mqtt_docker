# Thermostat MQTT container

Pulls data from Radio Thermostat local API and pushes to MQTT every minute.

## Usage

### Example docker-compose

```yaml
version: '3.2'
services:
    thermostat_mqtt:
        container_name: thermostat_mqtt
        image: thermostat_test
        environment:
          - MQTT_SERVER=10.0.1.22
          - MQTT_PORT=1883
          - THERMOSTAT_IP=10.0.1.29
        restart: always
```
