# Personal Dotfiles
Dotfiles handled as a bare repo in ~/.dotfiles


## Usage
Create a dotfiles alias in your sh config
```
alias dotfiles='/usr/local/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```
## Setting up a new machine
Simply run the below command to setup all your dotfiles on a new machine
```
git clone --separate-git-dir=$HOME/.dotfiles https://github.com/wahaj/dotfiles.git ~
```
### Resolves sync issues 
Run the following commands instead if you have sync issues with existing configs 
```
git clone --separate-git-dir=$HOME/.dotfiles https://github.com/wahaj/.dotfiles.git tmpdotfiles
rsync --recursive --verbose --exclude '.git' tmpdotfiles/ $HOME/
rm -r tmpdotfiles
```
---
## First time setup
```
mkdir $HOME/.dotfiles
git init --bare $HOME/.dotfiles
```
## Updating
Add a remote, and set status not to show untracked files:
```
dotfiles config --local status.showUntrackedFiles no
dotfiles remote add origin git@github.com:wahaj/dotfiles.git 
```
Add the config files you want to be in version control from where they are supposed to be, commit and push
```
cd $HOME
dotfiles add .zshrc
dotfiles commit -m "Add .zshrc"
dotfiles push
```

