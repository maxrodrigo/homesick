# Imports
# Declare an array variable
declare -a dotfiles=(".aliases" ".exports" ".secrets")

for df in "${dotfiles[@]}"; do
    [ -f ${HOME}/$df ] && source ${HOME}/$df
done

# Start zim
[[ -s ${ZIM_HOME}/init.zsh ]] && source ${ZIM_HOME}/init.zsh

# direnv
eval "$(direnv hook zsh)"
