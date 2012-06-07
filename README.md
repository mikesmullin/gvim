# Mike Smullin's GVIM Configuration

Use it if you want, don't if you dont.

## Installation

```bash
sudo apt-get install vim-gtk ack-grep exuberant-ctags
git clone git://github.com/mikesmullin/gvim.git ~/.vim
ln -s ~/.vim/.vimrc ~/
ln -s ~/.vim/.fonts ~/
cd ~/.vim
git submodule update --init --recursive # also run periodically to receive updates
```

## Gitting moar VIM plugins

```bash
./install.sh git://github.com/kchmck/vim-coffee-script.git
```
