
call ddc#custom#patch_global('ui', 'native')

call ddc#custom#patch_global('sourceOptions', #{
  \ _: #{
  \   matchers: ['matcher_head'],
  \   sorters: ['sorter_rank']},
  \ })

call ddc#custom#patch_global('sources', ['nvim-lsp', 'around'])

call ddc#custom#patch_global('sourceOptions', #{
  \   around: #{ mark: 'A' },
  \   nvim-lsp: #{
  \     mark: 'lsp',
  \     forceCompletionPattern: '\.\w*|:\w*|->\w*'
  \   },
  \ })

" \   copilot: #{
" \     mark: 'copilot',
" \     matchers: [],
" \     minAutoCompleteLength: 0,
" \   }
" let g:copilot_no_maps = v:true

call ddc#enable()

