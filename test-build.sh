docker build -t docker-magicmirror:latest .
docker run --rm \
	--publish 8080:8080 \
	--volume $PWD/config_volume:/opt/magicmirror/config \
	--volume $PWD/modules_volume:/opt/magicmirror/modules \
	--name docker-magicmirror \
	docker-magicmirror:latest
