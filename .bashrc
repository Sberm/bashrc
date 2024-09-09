server() {
	ssh root@sberm.cn
}

if [[ $TMUX ]]; then
	alias clear='clear && tmux clear-history'
fi

export gmail_pass="pmdf eplw fome sunx"

frp() {
	cd /root/hw/frp_0.52.1_linux_amd64 && ./frps -c frps.toml &
}

# terminal cursor shape
# results in sftp to be unusable
# echo -ne "\e[1 q"

alias fg="perf script > out.perf && ./stackcollapse-perf.pl out.perf > perf.col && ./flamegraph.pl perf.col > 1001.svg && cp 1001.svg ~/hw/sberf/"

# copying sym.h shortcut
alias symcp="cp ~/hw/sberf/src/sym.h ~/hw/sym.h/sym.h"

# sbcl installation path
export PATH=/usr/local/bin:$PATH

# bcc
bcctools=/usr/share/bcc/tools
bccexamples=/usr/share/bcc/examples
export PATH=$bcctools:$bccexamples:$PATH

# postgre
export psql_password="112358"

# react
export PATH=~/.npm/bin:$PATH

# fzf
export FZF_CTRL_T_OPTS="
  --preview 'cat {}'
  --bind 'ctrl-p:change-preview-window(hidden|)'"

# setd and cod
alias setd=set-display-func
set-display-func() {
	export DISPLAY=$1
}
alias cod="echo $DISPLAY | xclip"

alias docs="cd /root/hw/blog-hw/docs/md"
alias blog="cd /root/hw/blog-hw/md"

# alias vim="vimx"
alias vim="nvim"

# elixir utf-8
export ELIXIR_ERL_OPTIONS="+fnu"

# e -> exit
alias e="exit"

# quick print ram usage
pr() {
	ps aux | sort -rnk 4 | head -20 | awk '{comm_str=$11" "$12" "$13; \
						mem=$4*1800/100; \
						printf "%-7d %-5s%s  %-42s\n", \
						$2, mem, "MB", comm_str;}'
}

# go
export GOROOT=/usr/local/go
# export GOPATH=$HOME/Projects/Proj1 
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

move_to_trash() {
    mv $1 /root/.Trash
}
alias tsh=move_to_trash

# User bash prompt
#export PS1="\e[0;36m\]\W \[\e[0;32m\]$ \[\e[0;37m\]"
export PS1="\W $ "

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
# alias mv='mv -i'

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
. "$HOME/.cargo/env"
alias ts="transgender 2>/tmp/trans && cd \"\`tail -n 1 /tmp/trans\`\""
