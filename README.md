# brave-ladybug


# Error
```
gcr.io/google.com/cloudsdktool/cloud-sdk:latest
ERROR: (gcloud.functions.deploy) Missing required argument [runtime]: Flag `--runtime` is required for new functions.
ERROR
ERROR: build step 0 "gcr.io/google.com/cloudsdktool/cloud-sdk" failed: step exited with non-zero status: 1
```

# fixed
```
ERROR: (gcloud.functions.deploy) ResponseError: status=[403], code=[Ok], message=[Permission 'cloudfunctions.functions.get' denied on resource 'projects/brave-ladybug/locations/southamerica-east1/functions/helloWorld' (or resource may not exist).]
ERROR
ERROR: build step 0 "gcr.io/google.com/cloudsdktool/cloud-sdk" failed: step exited with non-zero status: 1
```
- fixed with:
1. Navigate to Cloud Build > Settings
2. Enable Cloud Functions Developer Role
- source https://stackoverflow.com/questions/61922879/error-gcloud-functions-deploy-responseerror-status-403-code-forbidden