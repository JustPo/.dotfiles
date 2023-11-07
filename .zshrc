source "$ZDOTDIR/zsh-functions"

# Plugins
zstyle ':autocomplete:*' ignored-input '..##'
zsh_add_file "zsh-prompt"
setopt autocd extendedglob nomatch menucomplete
setopt interactive_comments
stty -ixon <$TTY >$TTY
zle_highlight=('paste:none')
unsetopt BEEP

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

pdf () {
 selected=$(fd -e pdf | fzf --reverse --bind change:top)
 open -a "Preview" $selected
}

function fcd-all {
    current_buffer="$BUFFER"
    fzf_value=

    if [[ "$(echo "$current_buffer" | tr -d '[:space:]')" == "cd" ]]; then
    fzf_value=$(fd . --type directory | fzf-tmux -p --reverse --bind change:top) 
    elif [[ "$current_buffer" == "cd -A" ]]; then
    fzf_value= cd | $(fd . --type directory | fzf-tmux -p --reverse --bind change:top) 
    fi

    if [ -z "$fzf_value" ]; then
        zle reset-prompt
    else
        cd "$fzf_value"
        vcs_info
        zle reset-prompt
        zle kill-buffer
    fi
}

function fcd {
    current_buffer="$BUFFER"
    fzf_value=

    if [[ "$(echo "$current_buffer" | tr -d '[:space:]')" == "cd" ]]; then
    fzf_value=$(fd . --type directory | fzf-tmux -p --reverse --bind change:top) 
    elif [[ "$current_buffer" == "cd -A" ]]; then
    fzf_value= cd | $(fd . --type directory | fzf-tmux -p --reverse --bind change:top) 
    fi

    if [ -z "$fzf_value" ]; then
        zle reset-prompt
    else
        cd "$fzf_value"
        vcs_info
        zle reset-prompt
        zle kill-buffer
    fi
}

volume () {
  if [ $# -eq 0 ]
then
  osascript -e 'get output volume of (get volume settings)'
else
  osascript -e "set volume output volume $1"
fi
}

zle -N fcd-all
zle -N fcd
bindkey '^[[Z' fcd-all
bindkey -s '\tD' fcd

zsh_add_plugin "zsh-users/zsh-autosuggestions"
ZSH_AUTOSUGGEST_MANUAL_REBIND="on"
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_STRATEGY=(completion history)

