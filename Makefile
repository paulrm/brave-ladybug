check:
	curl  -s -w %{time_total}\\n https://southamerica-east1-brave-ladybug.cloudfunctions.net/helloWorld
	curl  -s -w %{time_total}\\n https://europe-west1-brave-ladybug.cloudfunctions.net/helloWorld
	curl  -s -w %{time_total}\\n https://asia-northeast2-brave-ladybug.cloudfunctions.net/helloWorld
	curl  -s -w %{time_total}\\n https://us-central1-brave-ladybug.cloudfunctions.net/helloWorld


up-postgres:
	docker-compose -f stack.yml up -d

upcloud-postgres:
	gcloud sql instances create brave-ladybug-db01 \
		--database-version=POSTGRES_12 \
		--cpu=2 \
		--memory=8GiB \
		--zone=us-central1-a \
		--root-password=password123

checkcloud-postgres:
	psql postgres://postgres:password@34.135.169.194:5432/ --command="\conninfo"


lscloud:
	gcloud sql instances list

downcloud-postgres:
	gcloud sql instances delete brave-ladybug-db

dbclean:
	psql postgres://postgres:example@localhost:5432 --command="drop database metric"

create-def:
	psql postgres://postgres:example@localhost:5432 --file=data-def.sql
	psql postgres://postgres:example@localhost:5432 metric --file=data-db.sql
	

insert-data:
	psql postgres://postgres:example@localhost:5432 metric --file=data-dump.sql

truncate-data:
	psql postgres://postgres:example@localhost:5432 metrics --command="TRUNCATE table metrics"

check-data:
	psql postgres://postgres:example@localhost:5432 metrics --command="SELECT * FROM metrics"

check-postgres:
	psql postgres://postgres:example@localhost:5432/

down-postgres:
	docker-compose -f stack.yml down


all-up-Process:
	docker-compose -f stack.yml up -d
	./wait-for-it.sh localhost:5432
	sleep 2
	psql postgres://postgres:example@localhost:5432 --file=data-def.sql
	psql postgres://postgres:example@localhost:5432 metric --file=data-db.sql
	psql postgres://postgres:example@localhost:5432 metric --file=data-dump.sql
	psql postgres://postgres:example@localhost:5432 metric --command="SELECT * FROM metrics"

deploy-helloGCS:
	gcloud functions deploy helloGCS \
	--entry-point=helloGCS \
	--source=functions/input \
	--runtime nodejs14 \
	--trigger-resource brave-ladybug \
	--trigger-event google.storage.object.finalize

setProject:
	 gcloud auth login paul.messina@gmail.com
	 gcloud config set project brave-ldaybug

web-deploy:
	gcloud functions deploy helloHttp \
	--entry-point=helloHttp \
	--source=functions/web \
	--runtime nodejs14 \
	--memory=128MB \
	--security-level=secure-always \
	--trigger-http \
	--allow-unauthenticated

web-check:
	curl -X POST https://us-central1-brave-ladybug.cloudfunctions.net/helloHttp -H "Content-Type:application/json"  -d '{"name":"Jane"}'

web-info:
	gcloud functions describe helloHttp

web-getlogs:
	gcloud logging read "resource.type=cloud_function AND resource.labels.function_name=helloHttp AND labels.execution_id=9qg3revtddkb" --project brave-ladybug --limit 10