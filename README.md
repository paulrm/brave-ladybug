# brave-ladybug

# sample code
```
exports.helloWorld = (req, res) => {
  console.log("requestHelloUSCentral");
  let message = req.query.message || req.body.message || 'Hello from Iowa!';
  res.status(200).send(message);
};
```
- el deploy funciono pero no logre especificar el trigger URL como lo hice manual


# No-Error
```
starting build "7b87c0dd-caf5-45a1-99e2-8c34da7501d9"

FETCHSOURCE
hint: Using 'master' as the name for the initial branch. This default branch name
hint: is subject to change. To configure the initial branch name to use in all
hint: of your new repositories, which will suppress this warning, call:
hint: 
hint: 	git config --global init.defaultBranch <name>
hint: 
hint: Names commonly chosen instead of 'master' are 'main', 'trunk' and
hint: 'development'. The just-created branch can be renamed via this command:
hint: 
hint: 	git branch -m <name>
Initialized empty Git repository in /workspace/.git/
From https://github.com/paulrm/brave-ladybug
 * branch            03db8b0e2c82983b8596c8330ced8cdffd837a22 -> FETCH_HEAD
HEAD is now at 03db8b0 2do try to deploy
BUILD
Pulling image: gcr.io/google.com/cloudsdktool/cloud-sdk
Using default tag: latest
latest: Pulling from google.com/cloudsdktool/cloud-sdk
1cfaf5c6f756: Pulling fs layer
42b2dd69543d: Pulling fs layer
141631adc29d: Pulling fs layer
f97923800de7: Pulling fs layer
437791582a97: Pulling fs layer
b34c287fdae0: Pulling fs layer
f02330f40d03: Pulling fs layer
3abd08178f0a: Pulling fs layer
f97923800de7: Waiting
437791582a97: Waiting
b34c287fdae0: Waiting
f02330f40d03: Waiting
3abd08178f0a: Waiting
141631adc29d: Verifying Checksum
141631adc29d: Download complete
42b2dd69543d: Verifying Checksum
42b2dd69543d: Download complete
1cfaf5c6f756: Verifying Checksum
1cfaf5c6f756: Download complete
b34c287fdae0: Verifying Checksum
b34c287fdae0: Download complete
437791582a97: Verifying Checksum
437791582a97: Download complete
3abd08178f0a: Verifying Checksum
3abd08178f0a: Download complete
f02330f40d03: Verifying Checksum
f02330f40d03: Download complete
1cfaf5c6f756: Pull complete
42b2dd69543d: Pull complete
141631adc29d: Pull complete
f97923800de7: Verifying Checksum
f97923800de7: Download complete
f97923800de7: Pull complete
437791582a97: Pull complete
b34c287fdae0: Pull complete
f02330f40d03: Pull complete
3abd08178f0a: Pull complete
Digest: sha256:f6f6de9b7ffadc56daaf063b5305ab21f0f1182bd80884dd450b40373d803dbc
Status: Downloaded newer image for gcr.io/google.com/cloudsdktool/cloud-sdk:latest
gcr.io/google.com/cloudsdktool/cloud-sdk:latest
Created .gcloudignore file. See `gcloud topic gcloudignore` for details.
WARNING: Function created with limited-access IAM policy. To enable unauthorized access consider `gcloud alpha functions add-iam-policy-binding helloWorld --region=southamerica-east1 --member=allUsers --role=roles/cloudfunctions.invoker`
Deploying function (may take a while - up to 2 minutes)...
..
For Cloud Build Logs, visit: https://console.cloud.google.com/cloud-build/builds;region=southamerica-east1/b32bbc3f-019e-4f56-af9f-3636dbd0c8f2?project=223859610547
availableMemoryMb: 256
buildId: b32bbc3f-019e-4f56-af9f-3636dbd0c8f2
buildName: projects/223859610547/locations/southamerica-east1/builds/b32bbc3f-019e-4f56-af9f-3636dbd0c8f2
entryPoint: helloWorld
httpsTrigger:
  securityLevel: SECURE_OPTIONAL
  url: https://southamerica-east1-brave-ladybug.cloudfunctions.net/helloWorld
ingressSettings: ALLOW_ALL
labels:
  deployment-tool: cli-gcloud
name: projects/brave-ladybug/locations/southamerica-east1/functions/helloWorld
runtime: nodejs14
serviceAccountEmail: brave-ladybug@appspot.gserviceaccount.com
sourceUploadUrl: https://storage.googleapis.com/gcf-upload-southamerica-ea-d55191cb-424a-4159-aa5c-ade5c440c025/c28f0b89-33ca-47f5-a36d-7cc6b36ea03a.zip
status: ACTIVE
timeout: 60s
updateTime: '2021-08-26T21:21:25.540Z'
versionId: '1'
.............................done.
PUSH
DONE
```

# fixed
```
Digest: sha256:f6f6de9b7ffadc56daaf063b5305ab21f0f1182bd80884dd450b40373d803dbc
Status: Downloaded newer image for gcr.io/google.com/cloudsdktool/cloud-sdk:latest
gcr.io/google.com/cloudsdktool/cloud-sdk:latest
Created .gcloudignore file. See `gcloud topic gcloudignore` for details.
API [cloudresourcemanager.googleapis.com] not enabled on project 
[223859610547]. Would you like to enable and retry (this will take a 
few minutes)? (y/N)?  
ERROR: (gcloud.functions.deploy) User [223859610547@cloudbuild.gserviceaccount.com] does not have permission to access projects instance [brave-ladybug:testIamPermissions] (or it may not exist): Cloud Resource Manager API has not been used in project 223859610547 before or it is disabled. Enable it by visiting https://console.developers.google.com/apis/api/cloudresourcemanager.googleapis.com/overview?project=223859610547 then retry. If you enabled this API recently, wait a few minutes for the action to propagate to our systems and retry.
- '@type': type.googleapis.com/google.rpc.Help
  links:
  - description: Google developers console API activation
    url: https://console.developers.google.com/apis/api/cloudresourcemanager.googleapis.com/overview?project=223859610547
- '@type': type.googleapis.com/google.rpc.ErrorInfo
  domain: googleapis.com
  metadata:
    consumer: projects/223859610547
    service: cloudresourcemanager.googleapis.com
  reason: SERVICE_DISABLED
ERROR
ERROR: build step 0 "gcr.io/google.com/cloudsdktool/cloud-sdk" failed: step exited with non-zero status: 1
```
- fixed enabling Cloud Resource Manager API


```
gcr.io/google.com/cloudsdktool/cloud-sdk:latest
ERROR: (gcloud.functions.deploy) Missing required argument [runtime]: Flag `--runtime` is required for new functions.
ERROR
ERROR: build step 0 "gcr.io/google.com/cloudsdktool/cloud-sdk" failed: step exited with non-zero status: 1
```
- fixed adding  --runtime=nodejs14



```
ERROR: (gcloud.functions.deploy) ResponseError: status=[403], code=[Ok], message=[Permission 'cloudfunctions.functions.get' denied on resource 'projects/brave-ladybug/locations/southamerica-east1/functions/helloWorld' (or resource may not exist).]
ERROR
ERROR: build step 0 "gcr.io/google.com/cloudsdktool/cloud-sdk" failed: step exited with non-zero status: 1
```
- fixed with:
1. Navigate to Cloud Build > Settings
2. Enable Cloud Functions Developer Role
- source https://stackoverflow.com/questions/61922879/error-gcloud-functions-deploy-responseerror-status-403-code-forbidden