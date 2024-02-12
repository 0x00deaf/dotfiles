#!/usr/bin/env bash

export USER_UID=$(id -u)
export USER_GID=$(id -g)
nice -n 20 code
