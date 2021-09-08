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
	psql postgres://postgres:example@34.135.169.194:5432/

# gcloud sql instances create prod-instance 
# --database-version=POSTGRES_9_6 
# --cpu=2 
# --memory=8GiB 
# --zone=us-central1-a 
# --root-password=password123	

# gcloud sql instances create tf-prod-db 
# --database-version=POSTGRES_9_6 
# --cpu=2 --memory=4GB 
# --region=europe-west3 
# --gce-zone=europe-west3-a 
# --backup 
# --storage-auto-increase
# 

	# - creo un mysql 
	# gcloud sql instances create brave-ladybug-db \
	# --tier=db-f1-micro \
	# --region=us-central	


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