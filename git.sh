# Setup github
echo Setting up git/github
echo 'Set your author name (for commits and log) to: '
read myname
echo 'Enter your github account email: '
read myemail
git config --global user.name "$myname"
git config --global user.email "$myemail"

ssh-keygen -t rsa -b 4096 -C "$myemail"
eval "$(ssh-agent -s)"
echo "Host *" >> ~/.ssh/config
echo "  AddKeysToAgent yes" >> ~/.ssh/config
echo "  UseKeychain yes" >> ~/.ssh/config
echo "  IdentityFile ~/.ssh/id_rsa" >> ~/.ssh/config
ssh-add -K ~/.ssh/id_rsa
pbcopy < ~/.ssh/id_rsa.pub

open "https://github.com/settings/ssh/new"
