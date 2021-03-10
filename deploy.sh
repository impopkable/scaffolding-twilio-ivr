#! /bin/bash

#echo "Download from ${1} then upload to ${2}"
if [ -z "${1}" ]
then
    echo "Download from staging then upload to production"
    bash download-flow.sh staging
    bash upload-flow.sh staging production
else
    echo "Download from ${1} then upload to ${2}"
    bash download-flow.sh ${1}
    bash upload-flow.sh ${1} ${2}
fi