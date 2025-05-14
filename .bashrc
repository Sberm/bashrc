# colorful ls
alias ls="ls --color=auto"

# transgender shell settings
TRANS="transgender"
if command -v $TRANS 2>&1 >/dev/null; then
  eval "$($TRANS --sh)"
fi

# remote server
function server() {
  ssh -Y root@sberm.cn
}

# tmux clear that clears the scroll buffer
if [[ $TMUX ]]; then
  alias clear='clear && tmux clear-history'
fi

# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# let's use neovim
alias vim="nvim"

# quick exit
alias e="exit"

# simple ram usage
function pr() {
  ps aux | sort -rnk 4 | head -20 | awk '{comm_str=$11" "$12" "$13; \
            mem=$4*1800/100; \
            printf "%-7d %-5s%s  %-42s\n", \
            $2, mem, "MB", comm_str;}'
}

# move to trash can
function tsh() {
  TSH="$HOME/.Trash"
  if [ ! -d $TSH ]; then
    mkdir $TSH
  fi
  mv -f $@ $TSH
}

# user bash prompt
export PS1="\W $ "

# global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi
