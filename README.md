# Mike Smullin's GVIM Configuration

Use it if you want, don't if you dont.

## Installation

```bash
sudo apt-get install vim-gtk ack-grep exuberant-ctags php-pear php5-tidy feh
git clone git://github.com/mikesmullin/gvim.git ~/.vim
ln -s ~/.vim/.vimrc ~/
ln -s ~/.vim/.tmux.conf ~/
ln -s ~/.vim/.fonts ~/; cd .fonts/; sudo fc-cache -fv; cd ..
cd ~/.vim
git submodule update --init --recursive # also run periodically to receive updates
sudo pear install PHP_Beautifier # should append version number
npm install -g coffee-script
cp ~/.vim/.gitconfig ~; vim ~/.gitconfig; # change name + email
```

## Gitting moar VIM plugins

```bash
./install.sh git://github.com/kchmck/vim-coffee-script.git
```
