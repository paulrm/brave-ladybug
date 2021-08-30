check:
	curl  -s -w %{time_total}\\n https://southamerica-east1-brave-ladybug.cloudfunctions.net/helloWorld
	curl  -s -w %{time_total}\\n https://europe-west1-brave-ladybug.cloudfunctions.net/helloWorld
	curl  -s -w %{time_total}\\n https://asia-northeast2-brave-ladybug.cloudfunctions.net/helloWorld
	curl  -s -w %{time_total}\\n https://us-central1-brave-ladybug.cloudfunctions.net/helloWorld


up-postgres:
	docker-compose -f stack.yml up -d


dbclean:
	psql postgres://postgres:example@localhost:5432 --command="drop database metric"

create-def:
	psql postgres://postgres:example@localhost:5432 --file=data-db.sql
	psql postgres://postgres:example@localhost:5432 metric --file=data-def.sql

insert-data:
	psql postgres://postgres:example@localhost:5432 --file=data-dump.sql

check-data:
	psql postgres://postgres:example@localhost:5432 metrics --command="SELECT * FROM metrics"

check-postgres:
	psql postgres://postgres:example@localhost:5432/

down-postgres:
	docker-compose -f stack.yml down