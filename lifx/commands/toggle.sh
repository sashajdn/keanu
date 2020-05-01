#!/bin/sh
### --- Toggle LIFX --- ###

#
## Toggles the LIFX power on/off
#

curl -X POST "https://api.lifx.com/v1/lights/group:Keanu/toggle" \
	-H "Authorization: Bearer $KEANU_LIFX_API_TOKEN" \
	-d '{"duration": 30.0}' \
	-H "Content-Type: application/json"
