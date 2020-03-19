# Minimal ZSH Plugin Manager
plugins_path=${ZDOTDIR:-$HOME}/.zsh_plugins
plugins=(
  zsh-users/zsh-autosuggestions
  zsh-users/zsh-completions
  zsh-users/zsh-history-substring-search
)

for plugin in $plugins; do
  # Clone from GitHub if it doesn't exist.
  if [[ ! -d $plugins_path/$plugin ]]; then
    mkdir -p $plugins_path/${plugin%/*}
    git clone --depth 1 --recursive https://github.com/$plugin.git $plugins_path/$plugin
  fi
  # Load.
  for plugin_init in ${plugin#*/}.zsh ${plugin#*/}.plugin.zsh ${plugin#*/}.sh; do
    if [[ -f $plugins_path/$plugin/$plugin_init ]]; then
      source $plugins_path/$plugin/$plugin_init
      break
    fi
  done
done

# clean up
unset plugins
unset plugin
unset plugin_init

# Update plugins
alias zupdate="find $plugins_path -type d -exec test -e '{}/.git' ';' -print0 | xargs -I {} -0 git -C {} pull"

# Imports
declare -a dotfiles=(".aliases" ".exports")

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
