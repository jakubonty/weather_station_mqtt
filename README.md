# Weather Station MQTT

This is port of maserver: https://github.com/sarnau/MMMMobileAlerts/tree/master/maserver from Markus Fritze. Some modifications were added to work with homeassistent.

To get it working you need to:
1) install Mosquitto broker plugin
2) install this Weather Station MQTT and configure it
3) check logs addon logs
4) list MQTT broker messages to get sensor: ```sudo apt-get install mosquitto-clients``` , ```mosquitto_sub -t "#" -h 192.168.0.123 -u username -P password```
5) add sensors to configuration.yml
```
sensor:
  - platform: mqtt
    name: bathroom_humidity
    state_topic: MobileAlerts/1148a76fa501/json
    unit_of_measurement: '%'
    value_template: "{{value_json.humidity[0]}}"
```

Hints for the ```config.json``` keys:
  * **localIPv4Address:** if set to null, then default IP address discovery will be used, otherwise use specified IP address (use homeassistant ip)
  * **gatewayIPv4Address:** ip address of gateway, you can get it from MobileAlerts application
  * **mqtt:** specify the address of the mqtt Server in the form ```mqtt://127.0.0.1```
  * **mqtt_home:** default MQTT path for the device parsed data
  * **logfile:** if specified, all packages will be logged in a logfile as a whole for future debugging
  * **logGatewayInfo:** display info about all found gateways
  * **proxyServerPort:** TCP port where the proxy is listening for incoming connections
  * **mobileAlertsCloudForward:** set to ```true``` if you want to forward the packages to the mobile alerts cloud
  * **serverPost:** set to the POST URL where the JSON data should be sent to
  * **serverPostUser**, **serverPostPassword**: Basic Authorization user and password for the POST URL

