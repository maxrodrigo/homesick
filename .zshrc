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
typeset -a dotfiles=(".aliases" ".exports")
for df in "${dotfiles[@]}"; do
    [ -f ${HOME}/$df ] && source ${HOME}/$df
done

# direnv
eval "$(direnv hook zsh)"
show_virtual_env() {
  if [[ -n "$VIRTUAL_ENV" && -n "$DIRENV_DIR" ]]; then
    echo "($(basename $VIRTUAL_ENV))"
  fi
}
PS1='$(show_virtual_env)'$PS1
