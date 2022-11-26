#!/bin/bash

# shellcheck source=/dev/null
source /tmp/NORB_ENVS

if [ "$NORB_STATUS" = "COMPLETED" ]; then
  export NORB_IMAGE="https://i.ibb.co/Sw6v9YH/checked.png"
else
  export NORB_IMAGE="https://i.ibb.co/Sw6v9YH/cancel.png"
fi

if [ -z "$GCHAT_WEBHOOK" ]; then
  NORB_REQUEST=$(< gchat-request.json envsubst)
  export NORB_REQUEST

  curl --header "Content-Type: application/json" \
       --request POST \
       --data "$NORB_REQUEST" \
       "$GCHAT_WEBHOOK"
fi