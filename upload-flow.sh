#! /bin/bash

. ./twilio.config
DEFINITION=$(node getDefinition.js ${1})
CURRENTFLOW=$STAGING_FLOW
if [ $2 = "production" ]
then
    CURRENTFLOW=$PRODUCTION_FLOW
elif [ $2 = "staging"]
then
    CURRENTFLOW=$STAGING_FLOW
else
    CURRENTFLOW=$2
fi
echo "Upload from ${1} to ${2} (${CURRENTFLOW})"
#echo $DEFINITION
curl -X POST "https://studio.twilio.com/v2/Flows/${CURRENTFLOW}" --data-urlencode "CommitMessage=Updated by ${EDITOR}" --data-urlencode "Definition=$DEFINITION" --data-urlencode "Status=published" -u $ACCOUNT_SID:$AUTH_TOKEN