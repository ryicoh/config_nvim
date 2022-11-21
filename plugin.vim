call plug#begin()
  Plug 'vim-denops/denops.vim'

  " ddu
  Plug 'Shougo/ddu.vim'
  Plug 'Shougo/ddu-ui-ff'
  Plug 'Shougo/ddu-kind-file'
  Plug 'Shougo/ddu-filter-matcher_substring'
  Plug 'Shougo/ddu-source-file_rec'
  Plug 'Shougo/ddu-source-file_old'
  Plug 'Shougo/ddu-source-rg'
  Plug 'Shougo/ddu-source-buffer'
  Plug 'Shougo/ddu-source-register'
  Plug 'matsui54/ddu-vim-ui-select'
  Plug 'matsui54/ddu-source-command_history'

  " lsp
  Plug 'neovim/nvim-lspconfig'

  " completion
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/vim-vsnip'
  Plug 'hrsh7th/cmp-vsnip'
  Plug 'hrsh7th/cmp-path'
  Plug 'rafamadriz/friendly-snippets'

  " languages
  Plug 'jparise/vim-graphql'
  Plug 'fatih/vim-go'

  " others
  Plug 'ryicoh/deepl.vim'
  Plug 'sainnhe/everforest'
  Plug 'ggandor/lightspeed.nvim'
  " Plug 'lambdalisue/gin.vim'

  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'

call plug#end()

" colorscheme
colorscheme everforest
let g:everforest_better_performance = 1
if has('termguicolors')
  set termguicolors
endif

let g:deepl#endpoint = "https://api-free.deepl.com/v2/translate"
let g:deepl#auth_key = readfile(expand("~/.config/nvim/deepl_auth_key.txt"))[0]

vnoremap <silent> t<C-e> <Cmd>call deepl#v("EN")<CR>
vnoremap <silent> t<C-j> <Cmd>call deepl#v("JA")<CR>
nnoremap <silent> t<C-e> yypV<Cmd>call deepl#v("EN")<CR>
nnoremap <silent> t<C-j> yypV<Cmd>call deepl#v("JA")<CR>
