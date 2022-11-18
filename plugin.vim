let dein_dir = expand('~/.cache/dein')
let dein_repo = dein_dir.'/repos/github.com/Shougo/dein.vim'
let &runtimepath .= ','.dein_repo

call dein#begin(dein_dir)

  call dein#add('vim-denops/denops.vim')

  " ddu
  call dein#add('Shougo/ddu.vim')
  call dein#add('Shougo/ddu-ui-ff')
  call dein#add('Shougo/ddu-kind-file')
  call dein#add('Shougo/ddu-filter-matcher_substring')
  call dein#add('Shougo/ddu-source-file_rec')
  call dein#add('shun/ddu-source-rg')
  call dein#add('lambdalisue/mr.vim')
  call dein#add('kuuote/ddu-source-mr')

  " lsp
  call dein#add('neovim/nvim-lspconfig')
  call dein#add('williamboman/mason.nvim')
  call dein#add('williamboman/mason-lspconfig.nvim')

  " completion
  call dein#add('hrsh7th/nvim-cmp')
  call dein#add('hrsh7th/cmp-nvim-lsp')
  call dein#add('hrsh7th/cmp-buffer')
  call dein#add('hrsh7th/vim-vsnip')
  call dein#add('hrsh7th/cmp-vsnip')
  call dein#add('hrsh7th/cmp-path')
  call dein#add('hrsh7th/cmp-cmdline')
  call dein#add('rafamadriz/friendly-snippets')

  " others
  call dein#add('sainnhe/everforest')
  call dein#add('fatih/vim-go')
  call dein#add('ggandor/lightspeed.nvim')
  call dein#add('tpope/vim-surround')

call dein#end()

colorscheme everforest
