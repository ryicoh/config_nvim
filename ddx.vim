call ddu#custom#patch_global({
\  'ui': 'ff',
\   'uiParams': {
\     'ff': {
\       'startFilter': v:true,
\       'prompt': '> ',
\     }
\   },
\  'kindOptions': {
\    'file_rec': {
\      'defaultAction': 'open',
\    },
\  },
\  'sources': [
\     {
\       'name': 'file_rec',
\       'params': {
\         'ignoredDirectories': [
\            '.git', 'vendor',
\            'node_modules', '.next', '.nuxt',
\          ]
\        }
\       }
\   ],
\   'sourceOptions': {
\     '_': {
\       'matchers': ['matcher_substring'],
\     },
\   }
\ })

nmap <space>f <Cmd>call ddu#start({'name': 'files_rec'})<CR>

autocmd FileType ddu-ff call s:ddu_ff_my_settings()
function! s:ddu_ff_my_settings() abort
  nnoremap <buffer> <CR> <Cmd>call ddu#ui#ff#do_action('quit')<CR>
  nnoremap <buffer> q <Cmd>call ddu#ui#ff#do_action('quit')<CR>
  nnoremap <buffer> <Esc> <Cmd>call ddu#ui#ff#do_action('quit')<CR>
endfunction

autocmd FileType ddu-ff-filter call s:ddu_filter_my_settings()
function! s:ddu_filter_my_settings() abort
  inoremap <buffer> <CR>
    \ <Esc><Cmd>call ddu#ui#ff#close()<CR>
    \ <Cmd>call ddu#ui#ff#do_action('itemAction', {'name': 'open'})<CR>

  nnoremap <buffer> <CR>
    \ <Esc><Cmd>call ddu#ui#ff#close()<CR>
    \ <Cmd>call ddu#ui#ff#do_action('quit')<CR>

  nnoremap <buffer> q <Cmd>call ddu#ui#ff#do_action('quit')<CR>
  inoremap <buffer> <C-c> <Cmd>call ddu#ui#ff#do_action('quit')<CR>

  inoremap <buffer> <C-t>
    \ <Cmd>call ddu#ui#ff#do_action('toggleSelectItem')<CR>
  inoremap <buffer> <C-j>
    \ <Cmd>call ddu#ui#ff#execute(
    \ "call cursor(line('.')+1,0)<Bar>redraw")<CR>
  inoremap <buffer> <C-k>
    \ <Cmd>call ddu#ui#ff#execute(
    \ "call cursor(line('.')-1,0)<Bar>redraw")<CR>
  inoremap <buffer> <C-d>
    \ <Cmd>call ddu#ui#ff#execute(
    \ "call cursor(line('.')+8,0)<Bar>redraw")<CR>
  inoremap <buffer> <C-u>
    \ <Cmd>call ddu#ui#ff#execute(
    \ "call cursor(line('.')-8,0)<Bar>redraw")<CR>
  inoremap <buffer> <C-f>
    \ <Cmd>call ddu#ui#ff#execute(
    \ "call cursor(line('.')+16,0)<Bar>redraw")<CR>
  inoremap <buffer> <C-b>
    \ <Cmd>call ddu#ui#ff#execute(
    \ "call cursor(line('.')-16,0)<Bar>redraw")<CR>
endfunction

