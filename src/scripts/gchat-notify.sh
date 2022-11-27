#!/bin/bash

# shellcheck source=/dev/null
source /tmp/NORB_ENVS

if [ "$NORB_STATUS" = "SUCCESS" ]; then
  export NORB_IMAGE="https://i.ibb.co/Sw6v9YH/checked.png"
else
  export NORB_IMAGE="https://i.ibb.co/Sw6v9YH/cancel.png"
fi

if [ -z "${WEBHOOK}" ];
then
  echo "Webhook URL is not provided."
else
  request="$(eval printf '%s' \""$GCHAT_REQ_TEMPLATE\"")"
  echo $request
  curl --header "Content-Type: application/json" \
       --request POST \
       --data request \
       "${GCHAT_WEBHOOK}"
fi
