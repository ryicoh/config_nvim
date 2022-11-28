source <sfile>:h/plugin.vim
source <sfile>:h/lsp.vim

set tabstop=2
set shiftwidth=2
set expandtab
set number
set signcolumn=yes
set updatetime=200
lang en_US.UTF-8

set clipboard&
set clipboard^=unnamedplus

cnoremap <M-b>  <S-Left>
cnoremap <M-f>  <S-Right>
inoremap <BS> <Nop>

command! -nargs=? E Explore <f-args>

set path=.,src/,~/.config/nvim

augroup typescrypt
  autocmd!
  autocmd BufRead *.ts,*.tsx set path=.,src/,~/.config/nvim
augroup END

augroup golang
  autocmd!
  autocmd BufRead *.go set path=**
augroup END
