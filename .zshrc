# Imports
# Declare an array variable
declare -a dotfiles=(".aliases" ".exports")

for df in "${dotfiles[@]}"; do
    [ -f ${HOME}/$df ] && source ${HOME}/$df
done

# Virtualenv Wrapper
source $(which virtualenvwrapper.sh)

# Start zim
[[ -s ${ZIM_HOME}/init.zsh ]] && source ${ZIM_HOME}/init.zsh

# added by travis gem
[ -f /Users/wxr/.travis/travis.sh ] && source /Users/wxr/.travis/travis.sh
