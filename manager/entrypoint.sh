#!/bin/bash

gcloud config set compute/zone us-central1-a
gcloud container clusters get-credentials taskmaster

exec "$@"