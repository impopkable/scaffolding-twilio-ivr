ACCOUNT_SID=$1
AUTH_TOKEN=$2
CURRENTFLOW=$3
echo "Download ${3} with $ACCOUNT_SID:$AUTH_TOKEN $CURRENTFLOW"
curl -X GET "https://studio.twilio.com/v2/Flows/${CURRENTFLOW}" -o flows/${3}.json -u $ACCOUNT_SID:$AUTH_TOKEN
