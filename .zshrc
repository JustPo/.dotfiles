source "$ZDOTDIR/zsh-utils"

#Files
zsh_add_file "zsh-widgets"
zsh_add_file "zsh-prompt"

#Settings
setopt autocd extendedglob nomatch menucomplete
setopt interactive_comments
stty -ixon <$TTY >$TTY
zle_highlight=('paste:none')
unsetopt BEEP
autoload edit-command-line
unsetopt AUTO_CD
alias vim='nvim'
export EDITOR='nvim'

# Plugins
zsh_add_plugin "zsh-users/zsh-autosuggestions"
ZSH_AUTOSUGGEST_MANUAL_REBIND="on"
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_STRATEGY=(completion history)


#Widgets
zle -N edit-command-line

#Bindings
bindkey '^I' autosuggest-accept
bindkey '^e' edit-command-line
export ANDROID_HOME=/Users/$USER/Library/Android/sdk
export PATH="$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools"
