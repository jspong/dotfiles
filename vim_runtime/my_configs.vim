let g:ctrlp_map = '<c-p>'
noremap <C-b> <PageUp>
noremap <C-f> <PageDown>

let g:syntastic_sh_checkers = ['shellcheck']
set number

setlocal spell spelllang=en_us
highlight SpellBad cterm=undercurl,underline,bold
