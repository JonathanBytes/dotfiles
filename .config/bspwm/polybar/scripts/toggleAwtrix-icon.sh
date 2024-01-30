#!/bin/bash
# Obtener el estado actual de la variable "power"
power_state=$(curl -s -X POST -H "Content-Type: application/json" --data '{"get": "powerState"}' http://awtrix.jonathanbytes.com:7000/api/v3/basics | jq -r '.powerState')

# echo $power_state

# Verificar el estado actual y cambiar la variable "power" en consecuencia
if [[ "$power_state" == "true" ]]; then
  echo "󰌬 "
else
	echo "%{F#FA5841}󰌮 %{u-}"
fi
