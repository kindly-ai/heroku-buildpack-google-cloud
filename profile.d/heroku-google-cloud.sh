#!/usr/bin/env bash

# Add gcloud to PATH
export PATH=/app/vendor/google-cloud-sdk/bin:$PATH

if [ -z $GOOGLE_CREDENTIALS ]; then
    echo "GOOGLE_CREDENTIALS not set"
else
    echo "$GOOGLE_CREDENTIALS" | base64 -d > /app/google-credentials.json
    gcloud auth activate-service-account --key-file /app/google-credentials.json
fi

# Set default project and compute zone
if [ ! -z $PROJECT ]; then
    gcloud config set project $PROJECT
fi
if [ ! -z $ZONE ]; then
    gcloud config set compute/zone $ZONE
fi
