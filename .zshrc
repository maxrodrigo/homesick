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
