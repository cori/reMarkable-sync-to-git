#!/bin/bash
set -euo pipefail

notify () {
  FAILED_COMMAND="$(caller): ${BASH_COMMAND}" \
    echo "Failed command: ${FAILED_COMMAND} -- $?"
}

trap notify ERR

echo '*+*+* 	starting the process'
export GIT_SSH_COMMAND="ssh -o StrictHostKeyChecking=no -i /data/id_ed25519"

cd /repo
git status

#1. add current files to git, commit
echo '*+*+* 	comitting loose changes'
git add .
git commit -a -m "$(date -u --rfc-3339=s) updates"

#0? git pull?
echo '*+*+* 	pulling from the remote'
git pull

#2. run remarkable cli command
echo '*+*+*	pulling from the reMarkable'
remarkable-cli -a pull -d 192.168.1.105 -u root --password IAMGROOT -b /repo

#3. add all files to git; commit
echo '*+*+*	comitting new changes'
git add .
git commit -a -m "$(date -u --rfc-3339=s) updates"

#4. git push
echo '*+*+*	pushing'
git push
