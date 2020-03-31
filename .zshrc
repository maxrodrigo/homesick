# Minimal ZSH Plugin Manager
typeset zdir=${ZDOTDIR:-$HOME}/.zsh_plugins
typeset -a zmods

zadd() {
  local zmodule=${1:t} zurl=${1}
  local zpath=${zdir}/${zmodule}
  zmods+=(${zpath})

  if [[ ! -d ${zpath} ]]; then
    mkdir -p ${zpath}
    git clone --recursive https://github.com/${zurl}.git ${zpath}
  fi

  local zscripts=(${zpath}/(init.zsh|${zmodule:t}.(zsh|plugin.zsh|zsh-theme|sh))(NOL[1]))
  source ${zscripts}
}

alias zclean="rm -rf $(echo ${zmods} $(ls -d ${zdir}/*) | tr ' ' '\n' | sort | uniq -u)"
alias zupdate="find ${zdir} -type d -exec test -e '{}/.git' ';' -print0 | xargs -I {} -0 git -C {} pull -q"

# Plugins
zadd zimfw/gitster
zadd zimfw/history
zadd zsh-users/zsh-syntax-highlighting
zadd zsh-users/zsh-history-substring-search
zadd zsh-users/zsh-autosuggestions
zadd zsh-users/zsh-completions

# zsh-history-substring-search
bindkey '\eOA' history-substring-search-up # or ^[OA
bindkey '\eOB' history-substring-search-down # or ^[OB
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
