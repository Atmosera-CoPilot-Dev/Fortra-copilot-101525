# This bash script uses git to synchronize changes between the local and remote GitHub repository.

# stage all changes
git add .

# commit changes with message 'Updated'
git commit -m "Synnchronized content"

# pull changes from remote repository on branch 'main'
git pull 

# push changes to remote repository on branch 'main'.
git push 




