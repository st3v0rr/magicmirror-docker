# MagicMirror-Docker

A Docker image for the [MagicMirror²](https://magicmirror.builders/) project.

[![Build and Push Docker Image](https://github.com/st3v0rr/magicmirror-docker/actions/workflows/docker-build-push.yml/badge.svg)](https://github.com/st3v0rr/magicmirror-docker/actions/workflows/docker-build-push.yml)

## Quick Start

### Using the Docker Image

The image is available on Docker Hub:

```bash
docker pull st3v0rr/magicmirror-docker:latest
```

### Simple Execution

Start the container with the following command:

```bash
docker run --rm \
    --publish 8080:8080 \
    --name magicmirror \
    st3v0rr/magicmirror-docker:latest
```

You can then access MagicMirror at http://localhost:8080.

## Volumes & Configuration

| Volume                           | Description                         |
|----------------------------------|-------------------------------------|
| `/opt/magicmirror/config`        | Folder for custom configurations    |
| `/opt/magicmirror/modules`       | Folder for custom modules           |

### Preparing Volumes

To prepare volumes for your custom configuration, run the following script:

```bash
./prepare-volumes.sh
```

This will:
- Create the `config_volume` and `modules_volume` directories
- Clone the MagicMirror repository
- Copy the default modules and configuration to the volume directories

### Starting with Volumes

After preparing the volumes, you can start the container with local volumes:

```bash
docker run --rm \
    --publish 8080:8080 \
    --name magicmirror \
    --volume $(pwd)/config_volume:/opt/magicmirror/config \
    --volume $(pwd)/modules_volume:/opt/magicmirror/modules \
    st3v0rr/magicmirror-docker:latest
```

## Customizing Configuration

The main configuration file is located at `config_volume/config.js`. Here you can:

- Change language and time format
- Configure or add new modules
- Adjust network settings

For complete documentation of configuration options, see the [official MagicMirror² documentation](https://docs.magicmirror.builders/configuration/introduction.html).

## Adding Custom Modules

1. Clone or download the desired module into the `modules_volume` directory
2. Add the module configuration to `config_volume/config.js`
3. Restart the container

## For Developers

### Project Structure

```
magicmirror-docker/
├── .github/workflows/     # GitHub Actions workflows
├── config.js              # Base configuration file
├── config_volume/         # Volume for custom configuration
├── Dockerfile             # Docker image definition
├── modules_volume/        # Volume for custom modules
├── prepare-volumes.sh     # Helper script to prepare volumes
└── README.md              # This documentation
```

### Building the Docker Image

To build the Docker image locally:

```bash
docker build -t magicmirror-docker .
```

### Continuous Integration/Deployment

The project uses GitHub Actions for CI/CD:
- Automatic builds on pushes to the `main` branch
- Automatic tagging and pushing of the image to Docker Hub
- Creation of version tags based on Git tags (`v*`)

### Image Variants

Tags on Docker Hub:
- `latest`: Current version based on the `main` branch
- `vX.Y.Z`: Specific version releases
- `X.Y`: Major.Minor versions for more stable updates

## Troubleshooting

### Common Issues

1. **Container fails to start**
   - Check the logs with `docker logs magicmirror`
   - Make sure port 8080 is not already in use

2. **Modules are not loading**
   - Check the configuration in `config_volume/config.js`
   - Verify that modules are correctly installed in `modules_volume`

3. **Permission issues with volumes**
   - The Docker image uses a user named `magicmirror`
   - Ensure that the local volumes are writable for this user

## License

This project is licensed under the MIT License - see [LICENSE](LICENSE) for details.

The MagicMirror² software is also licensed under the MIT License. For more information, visit the [official MagicMirror² website](https://magicmirror.builders/).
