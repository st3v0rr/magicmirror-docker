# magicmirror-docker
Docker Image for the MagicMirror project. See https://magicmirror.builders/

Docker hub: st3v0rr/docker-magicmirror
```bash
docker pull st3v0rr/docker-magicmirror
```

Example
```bash
docker run --rm \
	--publish 8080:8080 \
	--name docker-magicmirror \
	st3v0rr/docker-magicmirror:latest
```

## Volume options

| Option                            | Description
|-----------------                  |-----------
| `/opt/magicmirror/config`         | Folder for custom config
| `/opt/magicmirror/modules`        | Folder for custom modules

### Prepare volumes

Execute...
```bash
./prepare_volumes.sh
```

- Folders config_volume and modules_volume will be created
- Edit :-)
