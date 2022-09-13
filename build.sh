#!/usr/bin/env bash

set -ex

DOCKER_VERSION=podman

for i in $(jq -r '.value.bin[]' base/.torcx/manifest.json); do
  if [ ! -f "base$i" ]; then
    echo "$i" missing
    exit 1
  fi
done

for i in $(jq -r '.value.network[]' base/.torcx/manifest.json); do
  if [ ! -f "base$i" ]; then
    echo "$i" missing
    exit 1
  fi
done

CMD=( "tar" )
if [ "$(id -u)" = 0 ]; then
  true
elif [ -n "$(command -v fakeroot)" ]; then
  CMD=( "$(command -v fakeroot)" "tar" )
fi

"${CMD[@]}" --force-local -C base -zcvf docker:${DOCKER_VERSION}.torcx.tgz .

