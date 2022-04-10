#!/bin/sh

docker run -it --rm --mount type=bind,source=/share/homes/cori/repos/reMarkable-contents,target=/repo --mount type=bind,source=/share/homes/cori/repos/id_ed25519,target=/data/id_ed25519 remprocessor
