# Transgender.rs
function ts() {
  cd "$(transgender 3>&1 1>&2 2>&3 3>&- | tail -n 1)"
}

server() {
  ssh root@sberm.cn
}

if [[ $TMUX ]]; then
  alias clear='clear && tmux clear-history'
fi

export gmail_pass="pmdf eplw fome sunx"

# fzf
export FZF_CTRL_T_OPTS="
  --preview 'cat {}'
  --bind 'ctrl-p:change-preview-window(hidden|)'"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

alias vim="nvim"

# e -> exit
alias e="exit"

# quick print ram usage
pr() {
  ps aux | sort -rnk 4 | head -20 | awk '{comm_str=$11" "$12" "$13; \
            mem=$4*1800/100; \
            printf "%-7d %-5s%s  %-42s\n", \
            $2, mem, "MB", comm_str;}'
}

move_to_trash() {
    mv $1 /root/.Trash
}
alias tsh=move_to_trash

export PS1="\W $ "

alias rm='rm -i'
alias cp='cp -i'

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# cargo
. "$HOME/.cargo/env"
