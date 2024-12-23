if [ $TMUX ]; then
  tmux_refresh() {
    ssh_auth_sock=$(tmux show-environment | grep "^SSH_AUTH_SOCK")
    if [ -n "${ssh_auth_sock}" ]; then
      export "${ssh_auth_sock}"
    fi

    display=$(tmux show-environment | grep "^DISPLAY")
    if [ -n "${display}" ]; then
      export "${display}"
    fi
  }
fi

alias ls="ls --color=auto"

eval "$(transgender --sh)"

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
alias e="exit"

# simple ram usage
pr() {
  ps aux | sort -rnk 4 | head -20 | awk '{comm_str=$11" "$12" "$13; \
            mem=$4*1800/100; \
            printf "%-7d %-5s%s  %-42s\n", \
            $2, mem, "MB", comm_str;}'
}

# move to trash can
tsh() {
    mv -f $1 /root/.Trash
}

# user bash prompt
export PS1="\W $ "

alias rm='rm -i'
alias cp='cp -i'

# global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

. "$HOME/.cargo/env"
