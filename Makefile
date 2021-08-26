check:
	curl  -s -w %{time_total}\\n https://southamerica-east1-brave-ladybug.cloudfunctions.net/helloWorld
	curl  -s -w %{time_total}\\n https://europe-west1-brave-ladybug.cloudfunctions.net/helloWorld
	curl  -s -w %{time_total}\\n https://asia-northeast2-brave-ladybug.cloudfunctions.net/helloWorld
	curl  -s -w %{time_total}\\n https://us-central1-brave-ladybug.cloudfunctions.net/helloWorld