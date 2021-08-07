# PATH EXPORTS
export ZSH_CONFIG=$HOME/.zshrc
export PICO_SDK_PATH=$HOME/Documents/EmbeddedSystem/raspberry-pico/pico-sdk/
export NEOVIM_CONF=$HOME/.config/nvim/
export PATH=$PATH:$HOME/bin:/usr/local/bin:$HOME/.config/nvim/plugged/:$HOME/.local/bin

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# awesomepanda, af-magic, amuse
ZSH_THEME="amuse"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

DISABLE_AUTO_UPDATE="true"
DISABLE_UPDATE_PROMPT="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git
	zsh-autosuggestions
	zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

alias ls="exa -lah"
alias grep='rg'
alias cat='bat'
alias cls="clear ; ls"
alias v='vim'
alias nv='nvim'
alias sk='screenkey'
alias r='ranger'

# FFF file manager specific setups (show hidden files & use neovim 0.5.0 for default editor)
export EDITOR="nvim"
export FFF_HIDDEN=1

alias luamake=/home/yeyee2901/bin/lua-language-server/3rd/luamake/luamake
