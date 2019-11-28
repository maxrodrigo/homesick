# Imports
# Declare an array variable
declare -a dotfiles=(".aliases" ".exports")

for df in "${dotfiles[@]}"; do
    [ -f ${HOME}/$df ] && source ${HOME}/$df
done

# Start zim
[[ -s ${ZIM_HOME}/init.zsh ]] && source ${ZIM_HOME}/init.zsh

# TOOLS ##############################################

# Jekyll
export GEM_HOME=${HOME}/gems
export PATH=${HOME}/gems/bin:$PATH

# direnv
eval "$(direnv hook zsh)"
show_virtual_env() {
  if [[ -n "$VIRTUAL_ENV" && -n "$DIRENV_DIR" ]]; then
    echo "($(basename $VIRTUAL_ENV))"
  fi
}
PS1='$(show_virtual_env)'$PS1

# added by travis gem
[ -f /Users/max/.travis/travis.sh ] && source /Users/max/.travis/travis.sh
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
