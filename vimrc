" Expects https://github.com/amix/vimrc to be installed:
"
"    git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
"    sh ~/.vim_runtime/install_awesome_vimrc.sh
"

set runtimepath+=~/.vim_runtime

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim

try
source ~/.vim_runtime/my_configs.vim
catch
endtry
