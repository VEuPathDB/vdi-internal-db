default:
	@echo "what are you doing?"

docker-build:
	@docker build -t veupathdb/vdi-internal-db:latest .

docker-run:
	@docker run -it --rm \
		-p 5432:5432 \
		-e POSTGRES_USER=postgres \
		-e POSTGRES_PASSWORD=password \
		veupathdb/vdi-internal-db:latest