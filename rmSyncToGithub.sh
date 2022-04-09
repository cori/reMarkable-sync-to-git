echo 'comitting and pulling from the reMarkable'
cd /repo
git status

#0? git pull?
git remote -v
git pull

#1. add current files to git, commit
git add .
git commit -a -m "$(date -u --rfc-3339=s) updates"

#2. run remarkable cli command
remarkable-cli -a pull -d 192.168.1.105 -u root --password IAMGROOT -b /repo

#3. add all files to git; commit
git add .
git commit -a -m "$(date -u --rfc-3339=s) updates"

#4. git push
GIT_SSH_COMMAND="ssh -o StrictHostKeyChecking=no -i /data/id_ed25519 -vvvv" git push
