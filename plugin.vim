let dein_dir = expand('~/.cache/dein')
let dein_repo = dein_dir.'/repos/github.com/Shougo/dein.vim'
let &runtimepath .= ','.dein_repo

call dein#begin(dein_dir)

  call dein#add('vim-denops/denops.vim')
  call dein#add('Shougo/ddu.vim')
  call dein#add('Shougo/ddu-ui-ff')
  call dein#add('Shougo/ddu-kind-file')
  call dein#add('Shougo/ddu-filter-matcher_substring')
  call dein#add('Shougo/ddu-source-file_rec')

call dein#end()
