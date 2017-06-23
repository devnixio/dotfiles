 # dotfile

Initial config came  from Nicola Polucci  (https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/)


#### Setup

git init --bare $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> $HOME/.bashrc

### Import to new computer

Prior to the installation make sure you have committed the alias to your .bashrc or .zsh:

1
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
And that your source repository ignores the folder where you'll clone it, so that you don't create weird recursion problems:

1
echo ".cfg" >> .gitignore
Now clone your dotfiles into a bare repository in a "dot" folder of your $HOME:

1
git clone --bare <git-repo-url> $HOME/.cfg
Define the alias in the current shell scope:

1
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
Checkout the actual content from the bare repository to your $HOME:

1
config checkout
The step above might fail with a message like:

1
error: The following untracked working tree files would be overwritten by checkout:
2
    .bashrc
3
    .gitignore
4
Please move or remove them before you can switch branches.
5
Aborting
This is because your $HOME folder might already have some stock configuration files which would be overwritten by Git. The solution is simple: back up the files if you care about them, remove them if you don't care. I provide you with a possible rough shortcut to move all the offending files automatically to a backup folder:

1
mkdir -p .config-backup && \
2
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
3
xargs -I{} mv {} .config-backup/{}
Re-run the check out if you had problems:

1
config checkout
Set the flag showUntrackedFiles to no on this specific (local) repository:

1
config config --local status.showUntrackedFiles no
You're done, from now on you can now type config commands to add and update your dotfiles:

1
config status
2
config add .vimrc
3
config commit -m "Add vimrc"
4
config add .bashrc
5
config commit -m "Add bashrc"
6
config push

