source "$ZDOTDIR/zsh-functions"

# Plugins

zsh_add_file "zsh-prompt"

setopt autocd extendedglob nomatch menucomplete
setopt interactive_comments
stty -ixon <$TTY >$TTY
zle_highlight=('paste:none')
unsetopt BEEP
autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
_comp_options+=(globdots)	

mkcdir ()
{
    mkdir -p -- "$1" &&
       cd -P -- "$1"
}

bindkey '^I' autosuggest-accept

tmux_rename_window() {
  if [ -z "$1" ]; then 
    echo "Usage: tmux_rename_window <custom name>"
  else 
     tmux rename-window "$1"
  fi
}
dtrace_dump() {
  arg1="${1// /?}"
  sudo dtrace -qn 'pid$target:'"$arg1"'::entry { printf("%s\n",
  probefunc); } ' -p `pgrep "$1"` | grep -E "^[^@].*\."
}

if [ -d ~/codelldb/extension/adapter ]; then
 export PATH=$PATH:~/codelldb/extension/adapter
fi

unsetopt AUTO_CD
alias vim='nvim'
export EDITOR='nvim'

timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}

autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line
bindkey -r "^R"

pdf () {
 selected=$(fd -e pdf | fzf --reverse --bind change:top) || return 
 open -a "Preview" $selected
}

fcd () {
  selected=$(fd . --type directory | fzf --reverse --bind change:top) || return 
  cd $selected
}

volume () {
  if [ $# -eq 0 ]
then
  osascript -e 'get output volume of (get volume settings)'
else
  osascript -e "set volume output volume $1"
fi
}

zsh_add_plugin "zsh-users/zsh-autosuggestions"
ZSH_AUTOSUGGEST_MANUAL_REBIND="on"
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_STRATEGY=(completion history)
