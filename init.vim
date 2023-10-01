
execute 'source' expand('<sfile>:h') .. '/plug.vim'
execute 'source' expand('<sfile>:h') .. '/denops.vim'
execute 'source' expand('<sfile>:h') .. '/ddu.vim'
execute 'source' expand('<sfile>:h') .. '/lsp.vim'
execute 'source' expand('<sfile>:h') .. '/ddc.vim'
execute 'source' expand('<sfile>:h') .. '/lightspeed.vim'
execute 'source' expand('<sfile>:h') .. '/ai.vim'
execute 'source' expand('<sfile>:h') .. '/others.vim'

set number
set signcolumn=yes

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

colorscheme desert

function s:OpenNetrw(...)
  const fname = !isdirectory(expand('%')) ? expand('%:t') : ''

  execute ":Explore " .. join(a:000, ' ')

  if fname != ""
      call timer_start(50, { _ -> search('^' .. fname .. '$') })
  endif
endfunction

command! -nargs=* E call s:OpenNetrw(<f-args>)

