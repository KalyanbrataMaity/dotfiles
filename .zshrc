export ZSH="${HOME}/.oh-my-zsh"

# Theme.
ZSH_THEME="spaceship"
export SPACESHIP_DIR_TRUNC=0

# Plugins.
Plugins(git)

source $ZSH/oh-my-zsh.git

# Set colors for LS_COLORS.
eval 'dircolors ~/.dircolors'
