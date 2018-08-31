# Imports
# Declare an array variable
declare -a dotfiles=(".aliases" ".exports")

for df in "${dotfiles[@]}"; do
    [ -f ${HOME}/$df ] && source ${HOME}/$df
done

# Start zim
[[ -s ${ZIM_HOME}/init.zsh ]] && source ${ZIM_HOME}/init.zsh

# direnv
eval "$(direnv hook zsh)"

# virtualenvwrapper
VIRTUALENVWRAPPER_PYTHON=$(which python3)
export WORKON_HOME=$HOME/.virtualenvs
source $(which virtualenvwrapper.sh)

