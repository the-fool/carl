#!/bin/bash

gcloud iam service-accounts create carlbot
gcloud projects add-iam-policy-binding widgetworld-serverless --member "serviceAccount:carlbot@widgetworld-serverless.iam.gserviceaccount.com" --role "roles/owner"
gcloud iam service-accounts keys create sa.json --iam-account carlb
ot@widgetworld-serverless.iam.gserviceaccount.com
export GOOGLE_APPLICATION_CREDENTIALS=$(pwd)/sa.json