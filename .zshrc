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

# autocompletion
autoload -U +X bashcompinit && bashcompinit
autoload -U +X compinit && compinit

# zsh-history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# zsh-autosuggestions
bindkey '^[[Z' autosuggest-accept

# zsh-tab-title
ZSH_TAB_TITLE_CONCAT_FOLDER_PROCESS=true

# lscolors
. /usr/share/LS_COLORS/dircolors.sh

# Imports
typeset -a dotfiles=(".aliases" ".exports" ".functions" ".private")
for df in "${dotfiles[@]}"; do
    [ -f ${HOME}/$df ] && source ${HOME}/$df
done
