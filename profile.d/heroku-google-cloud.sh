#!/usr/bin/env bash
export PATH=/app/vendor/google-cloud-sdk/bin:$PATH
if [ -z $GOOGLE_CREDENTIALS ]; then
    echo "GOOGLE_CREDENTIALS not set"
else
    echo "$GOOGLE_CREDENTIALS" | base64 -d > /app/google-credentials.json
    gcloud auth activate-service-account --key-file /app/google-credentials.json
fi

# Set default project and compute zone
gcloud config set project $PROJECT
gcloud config set compute/zone $ZONE

# Install kubectl
gcloud components install kubectl --quiet
