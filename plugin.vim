call plug#begin()
  " Plug 'neovim/nvim-lspconfig'
  Plug 'Decodetalkers/csharpls-extended-lsp.nvim'

  " denops
  Plug 'vim-denops/denops.vim'
  Plug 'Shougo/ddu.vim'
  Plug 'Shougo/ddu-ui-ff'
  Plug 'Shougo/ddu-kind-file'
  Plug 'Shougo/ddu-filter-matcher_substring'
  Plug 'Shougo/ddu-source-file_rec'
  Plug 'Shougo/ddu-source-file_old'
  Plug 'Shougo/ddu-source-rg'
  Plug 'Shougo/ddu-source-file_external'
  Plug 'Shougo/ddu-filter-converter_display_word'
  Plug 'Shougo/ddu-source-line'

  " snippets
  Plug 'garbas/vim-snipmate'
  Plug 'MarcWeber/vim-addon-mw-utils'
  Plug 'tomtom/tlib_vim'
  Plug 'honza/vim-snippets'

  " languages
  Plug 'jparise/vim-graphql'
  Plug 'fatih/vim-go'

  " others
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'
  Plug 'tpope/vim-repeat'

  Plug 'ryicoh/deepl.vim'
  Plug 'ggandor/lightspeed.nvim'
  Plug 'kamykn/spelunker.vim'
  Plug 'andymass/vim-matchup'
  Plug 'cohama/lexima.vim'

call plug#end()

nnoremap <space>f <Cmd>Files<CR>
nnoremap <space>v <Cmd>Files ~/.config/nvim<CR>
nnoremap <space>r <Cmd>Rg<CR>
nnoremap <space>h <Cmd>History<CR>
nnoremap <space>b <Cmd>Buffers<CR>
nnoremap <space>c <Cmd>History:<CR>
nnoremap <space>/ <Cmd>History/<CR>
command! W w

" snippets
let g:snipMate = { 'snippet_version' : 1 }
imap <C-x>m <Plug>snipMateShow
imap <C-x><C-m> <Plug>snipMateShow

" colorscheme
colorscheme evening
if has('termguicolors')
  set termguicolors
endif

" DeepL
let g:deepl#endpoint = "https://api-free.deepl.com/v2/translate"
let g:deepl#auth_key = readfile(expand("~/.config/nvim/deepl_auth_key.txt"))[0]

vnoremap <silent> t<C-e> <Cmd>call deepl#v("EN")<CR>
vnoremap <silent> t<C-j> <Cmd>call deepl#v("JA")<CR>
nnoremap <silent> t<C-e> yypV<Cmd>call deepl#v("EN")<CR>
nnoremap <silent> t<C-j> yypV<Cmd>call deepl#v("JA")<CR>

" surround
let g:surround_no_mappings = v:true
nmap ds    <Plug>Dsurround
nmap cs    <Plug>Csurround
nmap cS    <Plug>CSurround
nmap ys    <Plug>Ysurround
nmap yS    <Plug>YSurround
xmap <C-y> <Plug>VSurround
xmap g<C-y> <Plug>VgSurround

" lightspeed
let g:lightspeed_no_default_keymaps = v:true
nnoremap <silent> s <Plug>Lightspeed_s
nnoremap <silent> S <Plug>Lightspeed_S
xnoremap <silent> s <Plug>Lightspeed_x
xnoremap <silent> S <Plug>Lightspeed_X

" spelunker
let g:spelunker_check_type = 2
