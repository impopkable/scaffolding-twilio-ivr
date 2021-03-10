#! /bin/bash
#check if have config file
#npm install twilio-cli -g
#check if have getbusiness hours url
echo "Impekable IVR scaffolding"
while : ; do
    read -p 'TWILIO ACCOUNT_SID: ' twiliosid
    if [ -z "$twiliosid" ]
    then
        echo "Please enter twilio SID"
    else
        break
    fi
done
while : ; do
    read -p 'TWILIO AUTH TOKEN: ' twilioauth
    if [ -z "$twilioauth" ]
    then
        echo "Please enter twilio auth token"
    else
        break
    fi
done
while : ; do
    read -p 'Your name: ' name
    if [ -z "$name" ]
    then
        echo "Please enter your name"
    else
        break
    fi
done
while : ; do
    read -p 'Production Flow ID (FWXX) : ' productionid
    if [ -z "$productionid" ]
    then
        echo "Please enter production flow id"
    else
        break
    fi
done
read -p 'Your IVR Flow ID (FWXX) (If not exist will copy from production): ' stagingid
echo "ACCOUNT_SID=$twiliosid" > twilio.config
echo "AUTH_TOKEN=$twilioauth" >> twilio.config
echo "PRODUCTION_FLOW=$productionid" >> twilio.config
echo "EDITOR=$name" >> twilio.config
if [ -z "$stagingid" ]
then
    echo "Cloning production to $name ivr"
    bash download-flow.sh production
    DEFINITION=$(node getDefinition.js production)
    curl -X POST "https://studio.twilio.com/v2/Flows" --data-urlencode "CommitMessage=First draft" --data-urlencode "FriendlyName=$name IVR" --data-urlencode "Status=published" --data-urlencode "Definition=$DEFINITION"  -u $twiliosid:$twilioauth > temp.staging
    stagingid=$(node getStagingName.js)
fi

echo "STAGING_FLOW=$stagingid" >> twilio.config
#\nAUTH_TOKEN=$twilioauth\nPRODUCTION_FLOW=$productionid\nSTAGING_FLOW=$stagingid
