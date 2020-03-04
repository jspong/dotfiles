" Disable ctrlp.vim
let g:ctrlp_map = '<c-p>'

" Set ctrl+b and ctrl+f back to page up and down
noremap <C-b> <PageUp>
noremap <C-f> <PageDown>

" Enable bash syntax checking (https://www.shellcheck.net)
"    requires `cabal install shellcheck` or `brew install shellcheck`
let g:syntastic_sh_checkers = ['shellcheck']

" Enable spell-check
setlocal spell spelllang=en_us
highlight SpellBad cterm=undercurl,underline,bold

" Enable markdown linking
"    requires `gem install mdl`
let g:syntastic_markdown_mdl_exec = 'markdownlint'
let g:syntastic_markdown_mdl_args = ''

" Display line numbers
set number

