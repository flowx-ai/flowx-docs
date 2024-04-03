# Mintlify Starter Kit

Click on `Use this template` to copy the Mintlify starter kit. The starter kit contains examples including

- Guide pages
- Navigation
- Customizations
- API Reference pages
- Use of popular components

### Development

Install the [Mintlify CLI](https://www.npmjs.com/package/mintlify) to preview the documentation changes locally. To install, use the following command

```
npm i -g mintlify
```

Run the following command at the root of your documentation (where mint.json is)

```
mintlify dev
```

### Publishing Changes

Install our Github App to autopropagate changes from youre repo to your deployment. Changes will be deployed to production automatically after pushing to the default branch. Find the link to install on your dashboard. 

#### Troubleshooting

- Mintlify dev isn't running - Run `mintlify install` it'll re-install dependencies.
- Page loads as a 404 - Make sure you are running in a folder with `mint.json`

### Run in a Docker container

The website can be run inside a Docker container, having the source code on the host machine mounted as volume.

This solution is meant to be used under **MacOS**.<br/>
For running under **Linux**, it needs a few more tweaks (**TODO**).

All the management is made through the [docker/run.sh](docker/run.sh) shell script, which delegates to the corresponding Docker commands.
The script can be run from the project root folder (as in the examples below) of from the actual [docker](docker) folder.

##### Prerequisites

Make sure [Docker](https://www.docker.com/) installed on the host machine.<br/>
For MacOS, [Docker Desktop](https://www.docker.com/products/docker-desktop/) is recommended.

##### Building the Docker image

From the project root folder, run: ```source docker/run.sh --build```.

The resulting image is named `docs-new:latest` and is based on the official **Node 20.12 Alpine** image.

##### Creating and starting the container

From the project root folder, run: ```source docker/run.sh --up```.

As a result, a Docker container, named `docs-new`, is created and started.<br/>
At this point, the Mintlify instance is **NOT** running yet and container access is needed start it.

##### Stopping and removing the container

From the project root folder, run: ```source docker/run.sh --down```.

This will stop and remove the existing `docs-new` container.

##### Starting the existing container

From the project root folder, run: ```source docker/run.sh --start```.

This command will start the already existing `docs-new` container.

Starting the container can have some extra parameters:
- `--run-mintlify`: starts and exposes the Mintlify instace to external traffic (a.k.a. it also executes the `mintlify dev` command)

##### Stopping the existing container

From the project root folder, run: ```source docker/run.sh --stop```.

##### Local machine browser access

The website is accessible from the host machine browser at [http://127.0.0.1:3000](http://127.0.0.1:3000).

Changing the source code on the host machine will automatically trigger website refresh.

##### TLDR

Initial run, from the project root folder:
```
source docker/run.sh --build
source docker/run.sh --up
source docker/run.sh --start --run-mintlify
```

Stop container:
```
source docker/run.sh --stop
```

Start container along with the Mintlify instance:
```
source docker/run.sh --start --run-mintlify
```

Clean-up resources:
```
source docker/run.sh --down
docker image rm docs-new
```
