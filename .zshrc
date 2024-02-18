# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Le theme
# ZSH_THEME="robbyrussell"

# Persistent history
export HISTFILE=~/.zsh_history
export HISTFILESIZE=10000
export HISTSIZE=10000
export SAVEHIST=10000

setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY

# Path
export PYENV_ROOT="$HOME/.pyenv"
export CARGO_ROOT="/home/jorenchik/.cargo"
export LOCAL_SCRIPTS="/home/jorenchik/.local/bin/scripts"
export PATH="$CARGO_ROOT/bin:$LOCAL_SCRIPTS:$PATH"
# export PGSYSCONFDIR="/home/jorenchik/Services"

source ~/.zplug/init.zsh
ZVM_VI_INSERT_ESCAPE_BINDKEY=jj

# Plugins 
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-history-substring-search"
zplug "plugins/git",   from:oh-my-zsh
zplug "plugins/sudo",   from:oh-my-zsh
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "MichaelAquilina/zsh-autoswitch-virtualenv"
zplug "jeffreytse/zsh-vi-mode"
zplug 'dracula/zsh', as:theme

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load

# <up> and <down> searches history with given prefix
bindkey -M viins "^[[A" history-beginning-search-backward
bindkey -M viins "^[[B" history-beginning-search-forward



# Aliases
alias tms='tmux-sessionizer.sh' 
alias runserver='python manage.py runserver'
alias makemigrations='python manage.py makemigrations'
alias migrate='python manage.py migrate'
alias twstart='python manage.py tailwind start'
alias ga="git add ."
alias gs="git status"
alias gm="git commit -m"

alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME' 
