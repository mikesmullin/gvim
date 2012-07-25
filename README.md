# Mike Smullin's GVIM Configuration

Use it if you want, don't if you dont.

## Installation

```bash
sudo apt-get install vim-gtk ack-grep exuberant-ctags rxvt-unicode-256color php-pear php5-tidy feh nodejs npm
git clone git://github.com/mikesmullin/gvim.git ~/.vim
ln -s ~/.vim/.vimrc ~/
ln -s ~/.vim/.bashrc ~/
ln -s ~/.vim/.Xdefaults ~/
ln -s ~/.vim/.tmux.conf ~/
ln -s ~/.vim/.fonts ~/; cd .fonts/; sudo fc-cache -fv; cd ..
sudo mv /etc/xdg/awesome/rc.lua /etc/xdg/awesome/rc.lua.bak
ln -s ~/.vim/awesome ~/.config/
cd ~/.vim
git submodule update --init --recursive # also run periodically to receive updates
sudo pear install PHP_Beautifier # should append version number
sudo npm install -g coffee-script
cp ~/.vim/.gitconfig ~; vim ~/.gitconfig; # change name + email
```

```bash
# ~/.tmux.conf
# 256 color support
set -g default-terminal "screen-256color"
```

```bash
# ~/.bashrc
# 256 color support
export TERM="screen-256color"
alias tmux="tmux -2"
# disable flow-control so Ctrl+S and Ctrl+Q work in vim
stty -ixon
```

```bash
# ~/.profile
# 256 color support
export TERM="screen-256color"
```


## Gitting moar VIM plugins

```bash
./install.sh git://github.com/kchmck/vim-coffee-script.git
```
