#!/bin/bash

gcloud builds submit . -t gcr.io/widgetworld-serverless/job-controller
