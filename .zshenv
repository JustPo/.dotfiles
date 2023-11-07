export XDG_CONFIG_HOME="$HOME"
export ZDOTDIR="$HOME"
export HISTFILE="$ZDOTDIR/.zhistory"    
export HISTSIZE=10000                   
export SAVEHIST=10000                   
export FZF_DEFAULT_OPTS='
  --scrollbar=''
  --height 40%
  --border=sharp
  --color=fg:#908caa,hl:#ebbcba
	--color=fg+:#e0def4,bg+:-1,hl+:#ebbcba
	--color=border:#403d52,header:#31748f,gutter:-1
	--color=spinner:#f6c177,info:#9ccfd8,separator:#403d52
	--color=pointer:#c4a7e7,marker:-1,prompt:#908caa'
export TERM='alacritty'
. "$HOME/.cargo/env"

