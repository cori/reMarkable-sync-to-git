#!/bin/sh

LOCAL_REPO_PATH="/share/homes/cori/repos/reMarkable-contents"
KEY_PATH="/share/homes/cori/repos/id_ed25519"
# REMARKABLE_IP="$3"
export REMARKABLE_ROOT_PWD="$1"
export SSH_CLIENT_IP=$(echo $SSH_CLIENT | cut -d' ' -f1)
docker run -it --rm --mount type=bind,source=$LOCAL_REPO_PATH,target=/repo --mount type=bind,source=$KEY_PATH,target=/data/id_ed25519 -e SSH_CLIENT_IP -e REMARKABLE_ROOT_PWD remprocessor 
