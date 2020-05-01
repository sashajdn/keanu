#!/bin/sh
### --- Authenticate --- ###

#
## Authorize
#

curl -H "Authorization: Bearer $KEANU_LIFX_API_TOKEN" "https://api.lifx.com/v1/lights/all"
