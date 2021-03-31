# μz
source ~/.uz/uz.zsh

zadd maxrodrigo/gitster
zadd zimfw/history
zadd zsh-users/zsh-syntax-highlighting
zadd zsh-users/zsh-history-substring-search
zadd zsh-users/zsh-autosuggestions
zadd zsh-users/zsh-completions

# Config
bindkey -e # Since EDITOR=vim, emacs mode has to be set manually.
autoload -U +X bashcompinit && bashcompinit
#setopt menucomplete

# Bash autocompletion
autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit

# zsh-history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
# zsh-autosuggestions
bindkey '^[[Z' autosuggest-accept

# Imports
typeset -a dotfiles=(".aliases" ".exports" ".private")
for df in "${dotfiles[@]}"; do
    [ -f ${HOME}/$df ] && source ${HOME}/$df
done

eval "$(direnv hook zsh)"
