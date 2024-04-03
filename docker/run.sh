#!/bin/sh --

usage() {
  echo "Usage: $0 [action] [options]"
  echo
  echo "Action: "
  echo "        --build                     Builds the docker image, using the existing docker-compose.yml (and docker-compose.override.yml) file(s)."
  echo "        --up                        Builds the docker image (if it not exists already), then creates and starts a container based on that image."
  echo "        --down                      Stops the running container and cleans up all the resources."
  echo "        --start [start_options]     Starts the already existing container."
  echo "        --stop                      Stops the running container. No resource cleanup is done."
  echo "        -h, --help                  Displays this help and exits."
  echo
  echo "start_options: "
  echo "        --run-mintlify              Run Mintlify by executing the 'mintlify dev' in the container to expose it to external traffic."
  echo
  echo "Builds the image, starts and stops the container"
  return 1 2>/dev/null  # Return command gives an error when the script is executed --> suppress the error message by forwarding it to /dev/null.
  exit 1                # This will not be called after the return command when the script is sourced.
}

abort() {
  echo "Error: " "$@" " Abort"
  echo
  usage
  return 1 2>/dev/null  # Return command gives an error when the script is executed --> suppress the error message by forwarding it to /dev/null.
  exit 1                # This will not be called after the return command when the script is sourced.
} >&2 # redirect to stderr

build_command() {
  docker-compose build
}

up_command() {
  docker-compose up --detach
}

down_command() {
  docker-compose down
}

start_command() {
  docker-compose start
  mintlify_command "$1"
}

stop_command() {
  docker-compose stop
}

mintlify_command() {
  unset run_mintlify

  if [ "$1" -eq 1 ]; then  
    run_mintlify="mintlify dev"
  fi
  
  docker exec -ti docs-new /bin/sh -c "$run_mintlify"
}

prepare_env_file() {
  printf "GROUP=%s\nGID=%s\nUSER=%s\nUID=%s" "$(id -gn)" "$(id -g)" "$(id -un)" "$(id -u)" > .env
}

# reset flags
unset BUILD
unset UP
unset DOWN
unset START
unset STOP

unset RUN_MINTLIFY

while true; do
case "$1" in
  --build)
    BUILD=1
    shift 1
    ;;
  --up)
    UP=1
    shift 1
    ;;
  --down)
    DOWN=1
    shift 1
    ;;
  --start)
    START=1
    shift 1
    ;;
  --stop)
    STOP=1
    shift 1
    ;;
  --run-mintlify)
    RUN_MINTLIFY=1
    shift 1
    ;;
  -h | --help)
    usage
    shift
    ;;
  *)
    break
    ;;
  esac
done

# Process remaining arguments
#for arg in "$@"; do
#  # do something with the argument
#done

WORKING_DIR=$(pwd)
DIR="$(cd "$(dirname -- "$0")" >/dev/null && pwd)"

# always running from the parent directory of the script so that it automatically picks all the docker-compose.*.yml files (i.e. docker-compose.override.yml)
cd "$DIR" || abort "Could not change directory to $DIR"
prepare_env_file

if [ -n "${BUILD+x}" ] && [ "$BUILD" -eq 1 ]; then
  build_command
elif [ -n "${UP+x}" ] && [ "$UP" -eq 1 ]; then
  up_command
elif [ -n "${DOWN+x}" ] && [ "$DOWN" -eq 1 ]; then
  down_command
elif [ -n "${START+x}" ] && [ "$START" -eq 1 ]; then
  start_command "$RUN_MINTLIFY"
elif [ -n "${STOP+x}" ] && [ "$STOP" -eq 1 ]; then
  stop_command
fi

cd "$WORKING_DIR" || abort "Could not change directory to $WORKING_DIR"