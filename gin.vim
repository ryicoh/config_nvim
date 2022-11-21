nnoremap <leader>s <Cmd>GinStatus<CR>
nnoremap <space>s <Cmd>GinStatus<CR>
nnoremap <leader>b <Cmd>GinBranch<CR>

function! s:my_gin_status() abort
  nnoremap <buffer><nowait> cc <Cmd>Gin commit -v<CR>
  nnoremap <buffer><nowait> s  <Plug>(gin-action-stage)
  nnoremap <buffer><nowait> a  <Plug>(gin-action-stage)
  nnoremap <buffer><nowait> u  <Plug>(gin-action-unstage)
  nnoremap <buffer><nowait> ca <Cmd>Gin commit -v --amend<CR>
  nnoremap <buffer><nowait> ds <Plug>(gin-action-diff)>
  nnoremap <buffer><nowait> e <Plug>(gin-action-edit)>
  nnoremap <buffer><nowait> r <Plug>(gin-action-reset)>

endfunction

augroup my-gin
  autocmd!
  autocmd User GinComponentPost redrawtabline
  autocmd FileType gin-status silent! call s:my_gin_status()
augroup END

let g:gin_status_default_args = ['++opener=split']
