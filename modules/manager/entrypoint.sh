#!/bin/bash

export G_PROJECT_ID="widgetworld-serverless"
export G_ZONE="us-central1-a"
export G_CLUSTER_NAME="taskmaster"

gcloud auth activate-service-account carlbot@$G_PROJECT_ID.iam.gserviceaccount.com --key-file /app/sa.json
gcloud config set project $G_PROJECT_ID
gcloud config set compute/zone $G_ZONE
gcloud container clusters get-credentials $G_CLUSTER_NAME

exec "$@"