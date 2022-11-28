call plug#begin()
  " Plug 'neovim/nvim-lspconfig'
  Plug 'Decodetalkers/csharpls-extended-lsp.nvim'

  " fuzzy search
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

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

  Plug 'sainnhe/everforest'
  Plug 'ryicoh/deepl.vim'
  Plug 'ggandor/lightspeed.nvim'
  Plug 'kamykn/spelunker.vim'
  Plug 'andymass/vim-matchup'
  Plug 'cohama/lexima.vim'

call plug#end()

" fuzzy search
let $FZF_DEFAULT_COMMAND = 'fd'
let $FZF_DEFAULT_OPTS = "--layout=reverse --info=inline --bind ctrl-b:page-up,ctrl-f:page-down,ctrl-u:up+up+up,ctrl-d:down+down+down"
let g:fzf_history_dir = '~/.local/share/fzf-history'

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
colorscheme everforest
let g:everforest_better_performance = 1
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
