alias dots='git --git-dir=$HOME/.gdots/ --work-tree=$HOME'
alias dots-add-modified='dots ls-files --modified | xargs git --git-dir=$HOME/.gdots/ --work-tree=$HOME add'
dots config status.showUntrackedFiles no
