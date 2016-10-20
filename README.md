### Yet another dotfiles repository

---

Installation
```
# Alias dots command
alias dots='git --git-dir=$HOME/.gdots/ --work-tree=$HOME'

# Install from git repository
git clone --recursive --separate-git-dir=$HOME/.gdots https://bitbucket.org/hthuong09/dotfiles /tmp/dots
# -r, --recursive             recurse into directories
# -v, --verbose               increase verbosity
# -l, --links                 When symlinks are encountered, recreate the symlink on the destination.
rsync -rvl --exclude ".git" /tmp/dots/ $HOME/
rm -r /tmp/dots
dots submodule update --init --recursive $HOME/
```