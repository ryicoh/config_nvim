call ddu#custom#patch_global({
\ 'ui': 'ff',
\ 'uiParams': {
\   'ff': {
\     'startFilter': v:true,
\   },
\ },
\ 'kindOptions': {
\   'file': {
\     'defaultAction': 'open',
\   },
\ },
\ 'sourceOptions': {
\   '_': {
\     'matchers': ['matcher_substring'],
\   },
\ },
\ })

command! -nargs=? -complete=dir Files call ddu#start({
\ 'name': 'files',
\ 'sources': [
\   {
\     'name': 'file_rec',
\     'params': {
\       'ignoredDirectories': [
\         '.git',
\         'build',
\         'node_modules',
\       ],
\     },
\     'options': { 'path': fnamemodify(<q-args>, ':p') },
\   },
\ ]
\ })

command! -nargs=? -complete=dir GFiles call ddu#start({
\ 'name': 'gfiles',
\ 'sources': [
\   {
\     'name': 'file_external',
\     'params': {
\       'cmd': ['git', 'ls-files'],
\       'path': fnamemodify(<q-args>, ':p'),
\     },
\   },
\ ]
\ })

command! History call ddu#start({
\ 'name': 'history',
\ 'sources': [{ 'name': 'file_old' }]
\ })

command! -nargs=? -complete=dir Rg call ddu#start({
\ 'name': 'rg',
\ 'sources': [
\   {
\     'name': 'rg',
\     'params': {
\       'args': ["--column", "--no-heading", "--color", "never", "--json"],
\     },
\     'options': {
\       'matchers': ['converter_display_word', 'matcher_substring'],
\       'path': expand(<q-args>) 
\     },
\   },
\ ],
\ 'uiParams': {'ff': {
\   'ignoreEmpty': v:false,
\   'autoResize': v:false,
\ }},
\ 'volatile': v:true,
\ })

command! Lines call ddu#start({
\ 'name': 'line',
\ 'sources': [{ 'name': 'line' }]
\ })


autocmd FileType ddu-ff-filter call s:ddu_filter_my_settings()
function! s:ddu_filter_my_settings() abort
  inoremap <buffer> <CR>
  \ <Cmd>call ddu#ui#ff#do_action('itemAction')<CR>

  let b:lexima_disabled = v:true
  inoremap <buffer><nowait> <Esc> <Cmd>call ddu#ui#ff#do_action('quit')<CR>

  inoremap <buffer> <C-j>
  \ <Cmd>call ddu#ui#ff#execute(
  \ "call cursor(line('.')+1,0)<Bar>redraw")<CR>
  inoremap <buffer> <C-k>
  \ <Cmd>call ddu#ui#ff#execute(
  \ "call cursor(line('.')-1,0)<Bar>redraw")<CR>
  inoremap <buffer> <C-f>
  \ <Cmd>call ddu#ui#ff#execute(
  \ "call cursor(line('.')+10,0)<Bar>redraw")<CR>
  inoremap <buffer> <C-b>
  \ <Cmd>call ddu#ui#ff#execute(
  \ "call cursor(line('.')-10,0)<Bar>redraw")<CR>
  inoremap <buffer> <C-d>
  \ <Cmd>call ddu#ui#ff#execute(
  \ "call cursor(line('.')+5,0)<Bar>redraw")<CR>
  inoremap <buffer> <C-u>
  \ <Cmd>call ddu#ui#ff#execute(
  \ "call cursor(line('.')-5,0)<Bar>redraw")<CR>
endfunction
