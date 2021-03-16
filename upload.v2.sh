#! /bin/bash
ACCOUNT_SID=$1
AUTH_TOKEN=$2
DEFINITION=$(node getDefinition.js ${3})
CURRENTFLOW=$4

echo "Upload from ${3} to ${CURRENTFLOW} "
#echo $DEFINITION
curl -X POST "https://studio.twilio.com/v2/Flows/${CURRENTFLOW}" --data-urlencode "CommitMessage=Updated by ${EDITOR}" --data-urlencode "Definition=$DEFINITION" --data-urlencode "Status=published" -u $ACCOUNT_SID:$AUTH_TOKEN