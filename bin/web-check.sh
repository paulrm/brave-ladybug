
file=$( mktemp )
curl -v -X POST https://us-central1-brave-ladybug.cloudfunctions.net/helloHttp -H "Content-Type:application/json"  -d '{"name":"Jane"}' -w \\ntime_total=%{time_total}\\n  > $file 2>&1
cat $file
echo "-------"
awk '/Hello/ { print $0 }' $file
execId=$( awk '/< function-execution-id:/ { print $3 }' $file )
echo $execId > /tmp/web-execution.id
rm -f $temp
