docker build -t docker-magicmirror:latest .
docker run --rm \
	--publish 8080:8080 \
	--name docker-magicmirror \
	docker-magicmirror:latest
