source <sfile>:h/plugin.vim
source <sfile>:h/ddu.vim

lua require('lsp')
lua require('motion')
lua require('completion')

set tabstop=2
set shiftwidth=2
set expandtab
set number

set signcolumn=yes
set updatetime=200
lang en_US.UTF-8

command! E Explore
