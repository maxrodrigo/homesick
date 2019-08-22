# Imports
# Declare an array variable
declare -a dotfiles=(".aliases" ".exports")

for df in "${dotfiles[@]}"; do
    [ -f ${HOME}/$df ] && source ${HOME}/$df
done

# Start zim
[[ -s ${ZIM_HOME}/init.zsh ]] && source ${ZIM_HOME}/init.zsh

# PATH

# Ruby
export PATH=/usr/local/opt/ruby/bin:$PATH

# Speeding up ZSH
autoload -Uz compinit
if [ $(date +'%j') != $(stat -f '%Sm' -t '%j' ~/.zcompdump) ]; then
  compinit
else
  compinit -C
fi

# TOOLS ##############################################

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


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/max/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/max/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/max/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/max/google-cloud-sdk/completion.zsh.inc'; fi
