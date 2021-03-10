#! /bin/bash

. ./twilio.config
CURRENTFLOW=$STAGING_FLOW
if [ $1 = "production" ]
then
    CURRENTFLOW=$PRODUCTION_FLOW
else
    CURRENTFLOW=$1
fi
    
echo "Download ${1} with $ACCOUNT_SID:$AUTH_TOKEN $CURRENTFLOW"
curl -X GET "https://studio.twilio.com/v2/Flows/${CURRENTFLOW}" -o flows/${1}.json -u $ACCOUNT_SID:$AUTH_TOKEN
