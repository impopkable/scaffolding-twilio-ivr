#create a profile for each environment

echo "Impekable Create a profile"
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
    read -p "profile's name: " name
    if [ -z "$name" ]
    then
        echo "Please enter profile name"
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
mkdir profiles/${name}
mkdir profiles/${name}/flows
echo "ACCOUNT_SID=$twiliosid" > profiles/${name}/.config
echo "AUTH_TOKEN=$twilioauth" >> profiles/${name}/.config
echo "PRODUCTION_FLOW=$productionid" >> profiles/${name}/.config