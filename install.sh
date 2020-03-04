for DOTFILE in $(find . -type f ! -name '.*' | grep -v .git | grep -v install.sh | grep -v README.md); do
    DOTNAME=$(echo $DOTFILE | sed 's/\.\//./')
    mkdir -p $(dirname $HOME/$DOTNAME)
    ln -s $(pwd)/$DOTFILE $HOME/$DOTNAME
    echo "symlink $HOME/$DOTNAME created"
done
