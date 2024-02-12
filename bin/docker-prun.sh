#!/bin/bash
source docker-pull.sh
HOME_DIR=$(readlink -f ~)
USER=$(whoami)
USER_ID=$(id -u)
docker run --net=host -u $USER_ID --security-opt seccomp=unconfined -v=$HOME_DIR:$HOME_DIR -w="$HOME_DIR" -eHOME=$HOME_DIR -it --rm $DOCKER_RESULT_IMAGE /bin/bash --rcfile /etc/bashrc

