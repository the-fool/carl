#!/bin/bash

gcloud iam service-accounts create carlbot > /dev/null 2>&1
RESULT=$?
if [ $RESULT -ne 0 ]; then
    gcloud projects add-iam-policy-binding widgetworld-serverless --member "serviceAccount:carlbot@widgetworld-serverless.iam.gserviceaccount.com" --role "roles/owner"
fi

gcloud iam service-accounts keys create sa.json --iam-account carlbot@widgetworld-serverless.iam.gserviceaccount.com

# export GOOGLE_APPLICATION_CREDENTIALS=$(pwd)/sa.json

# the Manager program needs this key file
cp sa.json ../modules/manager
