#!/bin/bash
set -euo pipefail

notify () {
    echo "Error on line ${LINENO}: ${BASH_COMMAND}"
}

trap notify ERR

echo '*+*+* 	starting the process'
export GIT_SSH_COMMAND="ssh -o StrictHostKeyChecking=no -i /data/id_ed25519"

cd /repo
git status

echo '*+*+* 	comitting loose changes'
git add .
git diff-index --quiet HEAD || git commit -a -m "$(date -u --rfc-3339=s) updates"

echo '*+*+* 	pulling from the remote'
git pull

echo '*+*+*	pulling from the reMarkable'
remarkable-cli -a pull -d 192.168.1.105 -u root --password IAMGROOT -b /repo

echo '*+*+*	comitting new changes'
git add .
git diff-index --quiet HEAD || git commit -a -m "$(date -u --rfc-3339=s) updates"

echo '*+*+*	pushing'
git push
