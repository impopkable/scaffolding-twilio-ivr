#! /bin/bash
#check if have config file
#npm install twilio-cli -g
#check if have getbusiness hours url
echo "Impekable deploy IVR v2."
#check if have params 1 or params 

while : ; do
    if [ -z "$1" ]
    then
        read -p "Copy from Source's profile (Will create if non exist) " sourceProfile
    else
        sourceProfile=$1
    fi
    
    if [ -d "./profiles/${sourceProfile}" ]
    then
        break
    else
        echo "Creating a profile ${sourceProfile}"
        bash create-profile.v2.sh $sourceProfile
        break
    fi
done

while : ; do
    if [ -z "$2" ]
    then
        read -p "Copy from Destiny's profile (Will create if non exist)" destinyProfile
    else
        destinyProfile=$2
    fi
    
    if [ -d "./profiles/$destinyProfile" ]
    then
        echo "created"
        break;
    else
        echo "Creating a profile ${destinyProfile}"
        bash create-profile.v2.sh $destinyProfile
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
. ./profiles/${sourceProfile}/.config
FROM_SID=$ACCOUNT_SID
FROM_AUTH=$AUTH_TOKEN
FROM_FLOW=$PRODUCTION_FLOW
. ./profiles/${destinyProfile}/.config
TO_SID=$ACCOUNT_SID
TO_AUTH=$AUTH_TOKEN
TO_FLOW=$PRODUCTION_FLOW
bash download.v2.sh $FROM_SID $FROM_AUTH $FROM_FLOW
bash upload.v2.sh $TO_SID $TO_AUTH $FROM_FLOW $TO_FLOW