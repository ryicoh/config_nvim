
call plug#begin()
  " AI
  Plug 'github/copilot.vim', {'commit': '1358e8e'}
  Plug 'madox2/vim-ai', {'commit': 'a167e48'}

  " LSP
  Plug 'neovim/nvim-lspconfig', {'commit': '90f5b0c'}

  " Motion
  " Plug 'ggandor/lightspeed.nvim', {'commit': '299eefa'}

  " Denops
  Plug 'vim-denops/denops.vim', {'commit': '68f607d'}
  Plug 'vim-denops/denops-shared-server.vim', {'commit': 'f4742b5'}

  " Completion
  Plug 'Shougo/ddc.vim', {'commit': '87469d5'}
  Plug 'Shougo/ddc-ui-native', {'commit': 'cc29db3'}
  Plug 'Shougo/ddc-matcher_head', {'commit': '16727bb'}
  Plug 'Shougo/ddc-sorter_rank', {'commit': '5629761'}
  Plug 'Shougo/ddc-source-nvim-lsp', {'commit': 'a5b54a0'}
  Plug 'Shougo/ddc-source-around', {'commit': 'e119de9'}
  Plug 'Shougo/ddc-source-copilot', {'commit': 'f131b8a'}

  " Fuzzy finder
  Plug 'Shougo/ddu.vim', {'commit': 'f2a7e90'}
  Plug 'Shougo/ddu-ui-ff', {'commit': '8dfaefe'}
  Plug 'Shougo/ddu-filter-matcher_substring', {'commit': '2d3f092'}
  Plug 'Shougo/ddu-kind-file', {'commit': '1abe972'}
  Plug 'Shougo/ddu-source-file_rec', {'commit': '4cbab6e'}
  Plug 'Shougo/ddu-source-file_old', {'commit': 'e0495ec'}
  Plug 'shun/ddu-source-rg', {'commit': 'a5ab71c'}
  Plug 'Shougo/ddu-filter-converter_display_word', {'commit': '14acfdf'}
  Plug 'matsui54/ddu-source-file_external', {'commit': '54fb945'}

  " Go
  Plug 'fatih/vim-go', {'commit': '3289077'}

  " Graphql
  Plug 'jparise/vim-graphql', {'commit': '996749a'}

  " Chrome
  Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

  Plug 'ryu-ichiroh/vim-cspell', {'tag': 'v0.5'}

  " My plugins
  Plug 'ryicoh/deepl.vim'
  Plug 'ryu-ichiroh/vim-cspell'

  " Experimental

call plug#end()
