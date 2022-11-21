source <sfile>:h/plugin.vim
source <sfile>:h/ddu.vim
" source <sfile>:h/gin.vim

lua require('lsp')
lua require('motion')
lua require('completion')

set tabstop=2
set shiftwidth=2
set expandtab
set number
set spelllang=en,cjk

set signcolumn=yes
set updatetime=200
lang en_US.UTF-8

command! -nargs=? E Explore <f-args>

cnoremap <M-b>  <S-Left>
cnoremap <M-f>  <S-Right>
