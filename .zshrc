# μz
source ~/.uz/uz.zsh

zadd maxrodrigo/gitster
zadd maxrodrigo/zsh-history
zadd zsh-users/zsh-syntax-highlighting
zadd zsh-users/zsh-history-substring-search
zadd zsh-users/zsh-autosuggestions
zadd zsh-users/zsh-completions
zadd maxrodrigo/zsh-kubernetes-contexts
zadd jreese/zsh-titles titles.plugin.zsh

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

# zsh-tab-title
ZSH_TAB_TITLE_CONCAT_FOLDER_PROCESS=true

# Imports
typeset -a dotfiles=(".aliases" ".exports" ".private")
for df in "${dotfiles[@]}"; do
    [ -f ${HOME}/$df ] && source ${HOME}/$df
done

eval "$(direnv hook zsh)"
