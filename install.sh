echo "Installing oh-my-zsh (https://ohmyz.sh)"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Installing Ultimate vimrc (https://github.com/amix/vimrc)"
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

echo "Installing vim plugins"
pushd ~/.vim_runtime/my_plugins
echo "  syntastic"
git clone https://github.com/vim-syntastic/syntastic.git
echo "  vim-grip"
pip install grip && git clone https://github.com/PratikBhusal/vim-grip.git

for DOTFILE in $(find . -type f ! -name '.*' | grep -v .git | grep -v install.sh | grep -v README.md); do
    DOTNAME=$(echo $DOTFILE | sed 's/\.\//./')
    mkdir -p $(dirname $HOME/$DOTNAME)
    ln -s $(pwd)/$DOTFILE $HOME/$DOTNAME
    echo "symlink $HOME/$DOTNAME created"
done
