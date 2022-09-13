#!/usr/bin/env bash

set -e -x

echo "Installer for podman docker-torcx"
mkdir -p /var/lib/torcx/store
cp -vf 'docker:podman.torcx.tgz' /var/lib/torcx/store/

mkdir -p /etc/torcx/profiles
cp -vf podman.json /etc/torcx/profiles/

echo "podman" > /etc/torcx/next-profile

echo "Done!"

