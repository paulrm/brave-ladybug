
if [ -f /tmp/web-execution.id ]
then
    execId=$( cat /tmp/web-execution.id )
    gcloud logging read "resource.type=cloud_function AND resource.labels.function_name=helloHttp AND labels.execution_id=$execId" --project brave-ladybug --limit 10
else
    gcloud logging read "resource.type=cloud_function AND resource.labels.function_name=helloHttp" --project brave-ladybug --limit 10
fi