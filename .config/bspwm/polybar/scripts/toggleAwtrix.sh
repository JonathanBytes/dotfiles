#!/bin/bash

# Obtener el estado actual de la variable "power"
power_state=$(curl -s -X POST -H "Content-Type: application/json" -d '{"get": "powerState"}' http://awtrix.jonathanbytes.com:7000/api/v3/basics | jq -r '.powerState')

# Verificar el estado actual y cambiar la variable "power" en consecuencia
if [[ "$power_state" == "true" ]]; then
  new_power_state="false"
else
  new_power_state="true"
fi

# Enviar la solicitud API para cambiar la variable "power"
curl -X POST -H "Content-Type: application/json" -d "{\"power\": $new_power_state}" http://awtrix.jonathanbytes.com:7000/api/v3/basics
