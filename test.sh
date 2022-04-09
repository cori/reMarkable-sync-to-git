echo 'comitting and pulling from the reMarkable'
cd /repo
git status

#0? git pull?

#1. add current files to git, commit
git add .
git commit -a -m "$(date -u --rfc-3339=s) updates"

#2. run remarkable cli command
remarkable-cli -a pull -d 192.168.1.105 -u root --password IAMGROOT

#3. add all files to git; commit
git add .
git commit -a -m "$(date -u --rfc-3339=s) updates"

#4. git push
