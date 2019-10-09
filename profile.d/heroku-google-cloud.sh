#!/usr/bin/env bash

# Add gcloud to PATH
export PATH=/app/vendor/google-cloud-sdk/bin:$PATH

if [ -z $GOOGLE_CREDENTIALS ]; then
    echo "GOOGLE_CREDENTIALS not set"
else
    export GOOGLE_APPLICATION_CREDENTIALS='/app/google-credentials.json'
    echo "$GOOGLE_CREDENTIALS" | base64 -d > $GOOGLE_APPLICATION_CREDENTIALS
    gcloud auth activate-service-account --key-file /app/google-credentials.json
fi

# Set default project and compute zone
if [ ! -z $PROJECT ]; then
    gcloud config set project $PROJECT
fi
if [ ! -z $ZONE ]; then
    gcloud config set compute/zone $ZONE
fi
