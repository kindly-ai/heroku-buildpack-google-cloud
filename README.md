# ✨ Heroku buildpack for Google Cloud
This buildpack installs Google Cloud, activates your service account and sets default project and compute zone.

## Config vars
- `GOOGLE_CREDENTIALS` – a base64-encoded Google Cloud service account key file (in JSON format) – see [gcloud auth activate-service-account](https://cloud.google.com/sdk/gcloud/reference/auth/activate-service-account). Given that you have a key file `key-file.json`, run the following to encode it in base64 and store the resulting base64 string in config var `GOOGLE_CREDENTIALS`:
```bash
GOOGLE_CREDENTIALS=$(base64 key-file.json)
heroku config:set GOOGLE_CREDENTIALS=$GOOGLE_CREDENTIALS
```
- `PROJECT` – your Google Cloud project
- `ZONE` - your Google Cloud compute zone
- `INSTALL_KUBECTL` – set this to 1 if you want to install `kubectl` as well