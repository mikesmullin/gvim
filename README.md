# Mike Smullin's GVIM Configuration

Use it if you want, don't if you dont.

## Installation

```bash
sudo apt-get install vim-gtk ack-grep exuberant-ctags rxvt-unicode-256color
git clone git://github.com/mikesmullin/gvim.git ~/.vim
ln -s ~/.vim/.vimrc ~/
ln -s ~/.vim/.Xdefaults ~/
ln -s ~/.vim/.tmux.conf ~/
ln -s ~/.vim/.fonts ~/; cd .fonts/; sudo fc-cache -fv; cd ..
cd ~/.vim
git submodule update --init --recursive # also run periodically to receive updates
```

```bash
# ~/.tmux.conf
# 256 color support
set -g default-terminal "screen-256color"
```

```bash
# ~/.bashrc
# 256 color support
export TERM="xterm-256color"
alias tmux="tmux -2"
```

```bash
# ~/.profile
# 256 color support
if [ -e /usr/share/terminfo/x/xterm-256color ]; then
  export TERM='xterm-256color'
else
  export TERM='xterm-color'
fi
```


## Gitting moar VIM plugins

```bash
./install.sh git://github.com/kchmck/vim-coffee-script.git
```
