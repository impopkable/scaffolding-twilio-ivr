#! /bin/bash
. ./twilio.config
#echo "Download from ${1} then upload to ${2}"
if [ -z "${1}" ]
then
    echo "Download from staging then upload to production"
    bash download-flow.sh $STAGING_FLOW
    bash upload-flow.sh $STAGING_FLOW production
else
    echo "Download from ${1} then upload to ${2}"
    bash download-flow.sh ${1}
    bash upload-flow.sh ${1} ${2}
fi