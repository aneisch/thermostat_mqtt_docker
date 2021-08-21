# Thermostat MQTT container
<a href="https://www.buymeacoffee.com/aneisch" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/default-black.png" width="150px" height="35px" alt="Buy Me A Coffee" style="height: 35px !important;width: 150px !important;" ></a><br>

Pulls data from Radio Thermostat local API and pushes to MQTT every minute.

## Usage

### Example docker-compose

```yaml
version: '3.2'
services:
    thermostat_mqtt:
        container_name: thermostat_mqtt
        image: ghcr.io/aneisch/thermostat_mqtt_docker:latest
        environment:
          - MQTT_SERVER=10.0.1.22
          - MQTT_PORT=1883
          - THERMOSTAT_IP=10.0.0.29
          - TOPIC=sensor/thermostat
        restart: always
```
