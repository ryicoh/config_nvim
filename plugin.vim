call plug#begin()
  Plug 'vim-denops/denops.vim'

  " ddu
  Plug 'Shougo/ddu.vim'
  Plug 'Shougo/ddu-ui-ff'
  Plug 'Shougo/ddu-kind-file'
  Plug 'Shougo/ddu-filter-matcher_substring'
  Plug 'Shougo/ddu-source-file_rec'
  Plug 'shun/ddu-source-rg'
  Plug 'lambdalisue/mr.vim'
  Plug 'kuuote/ddu-source-mr'
  Plug 'matsui54/ddu-vim-ui-select'

  " " lsp
  Plug 'neovim/nvim-lspconfig'

  " " completion
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/vim-vsnip'
  Plug 'hrsh7th/cmp-vsnip'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'rafamadriz/friendly-snippets'

  " " languages
  Plug 'jparise/vim-graphql'
  Plug 'fatih/vim-go'

  " " others
  Plug 'sainnhe/everforest'
  Plug 'ggandor/lightspeed.nvim'
  Plug 'tpope/vim-surround'
  Plug 'lambdalisue/gin.vim'

call plug#end()

" colorscheme
colorscheme everforest
let g:everforest_better_performance = 1
if has('termguicolors')
  set termguicolors
endif
