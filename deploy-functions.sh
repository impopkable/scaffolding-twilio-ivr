#! /bin/bash
#ask for API_KEY
#ask for API_TOKEN
#create a service name
#run deploy
echo "Impekable Deploy scaffolding Function"

echo "Please create a API KEY from https://www.twilio.com/console/project/api-keys"
while : ; do
    if [ -z "$1" ]
    then
        read -p 'TWILIO API SID (SKxxxx): ' apisid
    else
        apisid=$1
    fi
    
    if [ -z "$apisid" ]
    then
        echo "Please enter API SID(SKxxxx):"
    else
        break
    fi
done
while : ; do
    if [ -z "$2" ]
    then
        read -p 'TWILIO API KEY : ' apikey
    else
        apikey=$2
    fi
    
    if [ -z "$apikey" ]
    then
        echo "Please enter API Key:"
    else
        break
    fi
done
echo "ACCOUNT_SID=${apisid}" > functions/.env
echo "AUTH_TOKEN=${apikey}" >> functions/.env
cd functions && twilio serverless:deploy