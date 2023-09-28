#!/bin/bash

if podman inspect "$1" | grep --q '"Running": true'; then
  if podman logs "$1" | grep  -e "FreeIPA server configured." -e "FreeIPA server started"; then
    exit 0
  else
    echo not there yet
    exit 2
  fi
else
  echo >&2 "container with uuid/name $1 is not running stop waiting and fail"
  exit 1
fi
