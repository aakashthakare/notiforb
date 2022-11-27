#!/bin/bash

if [ -z "${GCHAT_WEBHOOK}" ];
then
  echo "Please set webhook URL in 'GCHAT_WEBHOOK' CircleCI environment variable."
else
  WEBHOOK_REQUEST="$(eval "echo \"$GCHAT_REQ_TEMPLATE\"")"

  curl --header "Content-Type: application/json" \
       --request POST \
       --data "$WEBHOOK_REQUEST" \
       "${GCHAT_WEBHOOK}"
fi
