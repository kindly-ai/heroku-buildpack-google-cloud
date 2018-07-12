# heroku-buildpack-google-cloud
✨ Heroku buildpack for Google Cloud

## Authenticating service account
### Config vars
- You need a config var `GOOGLE_CREDENTIALS` containing a base64-encoded Google Cloud service account key file (in JSON format) – see [gcloud auth activate-service-account](https://cloud.google.com/sdk/gcloud/reference/auth/activate-service-account). Given that you have a key file `key-file.json`, run the following to encode it in base64 and store it in config var `GOOGLE_CREDENTIALS`:
```bash
GOOGLE_CREDENTIALS=$(base64 key-file.json)
heroku config:set GOOGLE_CREDENTIALS=$GOOGLE_CREDENTIALS
```