
call ddu#custom#patch_global({
    \   'ui': 'ff',
    \   'uiParams': {
    \     'ff': {
    \       'previewFloating': v:true,
    \       'startFilter': v:true,
    \       'highlights': {
    \         'floating': 'Visual',
    \         'floatingBorder': 'Visual',
    \        },
    \     },
    \   },
    \   'sourceOptions': {
    \     '_': {
    \       'matchers': ['matcher_substring'],
    \     },
    \     'rg': {
    \       'matchers': ['converter_display_word', 'matcher_substring'],
    \     },
    \   },
    \   'filterParams': {
    \     'matcher_substring': {
    \       'highlightMatched': "Search",
    \     },
    \   },
    \   'sourceParams' : {
    \     'rg' : {
    \       'args': ['--column', '--no-heading', '--color', 'never'],
    \     },
    \     'file_rec': {
    \       'ignoredDirectories': ['.git', 'node_modules', 'vendor', '.next', 'storybook-static'],
    \     },
    \     'file_external': {
    \       'cmd': ['bash', '-c', 'cat <(git ls-files --modified --others --exclude-standard) <(git diff --name-only --cached) | uniq'],
    \     },
    \   },
    \   'kindOptions': {
    \     'file': {
    \       'defaultAction': 'open',
    \     }
    \   }
    \ })

autocmd FileType ddu-ff call s:ddu_ff_my_settings()
function! s:ddu_ff_my_settings() abort
  nnoremap <buffer> <CR>
    \ <Cmd>call ddu#ui#do_action('itemAction')<CR>
  nnoremap <buffer> <Space>
    \ <Cmd>call ddu#ui#do_action('toggleSelectItem')<CR>
  nnoremap <buffer> i
    \ <Cmd>call ddu#ui#do_action('openFilterWindow')<CR>
  nnoremap <buffer> q
    \ <Cmd>call ddu#ui#do_action('quit')<CR>
endfunction

autocmd FileType ddu-ff-filter call s:ddu_filter_my_settings()
function! s:ddu_filter_my_settings() abort
  inoremap <buffer> <CR>
    \ <Esc><Cmd>call ddu#ui#do_action('closeFilterWindow')<CR>
  nnoremap <buffer> <CR>
    \ <Cmd>call ddu#ui#do_action('closeFilterWindow')<CR>
endfunction

command! DduRgLive call <SID>ddu_rg_live()
function! s:ddu_rg_live() abort
  call ddu#start({
        \   'sources': [{
        \     'name': 'rg',
        \     'options': {
        \       'matchers': [],
        \       'volatile': v:true,
        \     },
        \   }],
        \   'uiParams': {'ff': {
        \     'ignoreEmpty': v:false,
        \     'autoResize': v:false,
        \   }},
        \ })
endfunction

autocmd FileType ddu-ff call s:ddu_my_settings()
function! s:ddu_my_settings() abort
  setlocal cursorline
endfunction

autocmd FileType ddu-ff-filter call s:ddu_filter_my_settings()
function! s:ddu_filter_my_settings() abort
  inoremap <buffer> <Esc>
    \ <Esc><Cmd>call ddu#ui#do_action('closeFilterWindow')<CR>
    \ <Cmd>call ddu#ui#do_action('quit')<CR>
  inoremap <buffer> <C-q>
    \ <Esc><Cmd>call ddu#ui#do_action('closeFilterWindow')<CR>
  inoremap <buffer> <CR>
    \ <Esc><Cmd>call ddu#ui#do_action('closeFilterWindow')<CR>
    \ <Cmd>call ddu#ui#do_action('itemAction')<CR>
  inoremap <buffer> <C-j>
    \ <Cmd>call ddu#ui#do_action('cursorNext')<CR>
  inoremap <buffer> <C-k>
    \ <Cmd>call ddu#ui#do_action('cursorPrevious')<CR>
  inoremap <buffer> <C-d>
    \ <Cmd>call ddu#ui#ff#execute('normal! 5j')<CR><Cmd>redraw<CR>
  inoremap <buffer> <C-u>
    \ <Cmd>call ddu#ui#ff#execute('normal! 5k')<CR><Cmd>redraw<CR>
endfunction

nmap <space>f <Cmd>call ddu#start(#{ sources: [#{ name: 'file_rec' }] })<CR>
nmap <space>h <Cmd>call ddu#start(#{ sources: [#{ name: 'file_old' }] })<CR>
nmap <space>g <Cmd>call ddu#start(#{ sources: [#{ name: 'file_external' }] })<CR>
nmap <space>r <Cmd>DduRgLive<CR>
