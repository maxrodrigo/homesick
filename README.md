#  Homesick

## Initiate the repository

```
cd ~
git init --bare $HOME/.dotfiles
alias conf='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
conf config status.showUntrackedFiles no 
```

1. Browse the home directory.
1. Create the git bare repository too keep track of the files.
1. Create an alias to interact with your configuration repository.
1. Set - local to the repository - to hide files we are not explicitly tracking yet.

    Is a good idea to add the alias to your shell configuration file. In my case under [.aliases](./.aliases).

After the setup any file within the $HOME folder can be versioned with normal git commands, replacing git with the config alias.

```
conf status
conf add .vimrc
conf commit -m "Add vim configuration file"
conf push
```

## Replicate your home directory onto a new system


```
alias conf='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
echo ".dotfiles" >> $HOME/.gitignore
git clone --bare https://github.com/maxrodrigo/homesick $HOME/.dotfiles
conf submodule update --recursive --remote
conf checkout
```

1. Recreate the alias.
1. The source repository ignores the folder it'll cloned, so to avoid recursion gitignore the repository folder.
1. Clone the repository into the chosen folder.
1. Update submodules
1. Checkout the content from the repository to your $HOME


If the pulled files already exist git will return an error: `Please move or remove them before you can switch branches.`  

Remove: `conf checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} rm -rf {}`  
Or backup: `conf checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \ xargs -I{} mv {} .conf-backup/{}`

And re-run: `conf checkout`

As a las step set local to hide files we are not explicitly tracking:
```
conf config --local status.showUntrackedFiles no
```


## Thanks

Thanks to Nicola Paolucci and StreakyCobra.

Based on: https://news.ycombinator.com/item?id=11070797
