
" https://stackoverflow.com/questions/35837990/how-to-trigger-omnicomplete-auto-completion-on-keystrokes-in-insert-mode
set completeopt=menuone,noselect,noinsert
function! s:lsp_completion() abort
  if pumvisible()
    return
  endif

  if (
    \ (v:char >= 'a' && v:char <= 'z') ||
    \ (v:char >= 'A' && v:char <= 'Z') ||
    \ (v:char == '.')
    \ )
    call feedkeys("\<C-x>\<C-o>")
  endif
endfunction

autocmd InsertCharPre *.ts,*.tsx,*.go,*.cs call s:lsp_completion()

imap <expr> <C-f> pumvisible() ? "\<C-n>\<C-n>\<C-n>\<C-n>\<C-n>\<C-n>" : "<C-f>"
imap <expr> <C-b> pumvisible() ? "\<C-p>\<C-p>\<C-p>\<C-p>\<C-p>\<C-p>" : "<C-b>"

function! s:show_lsp_clients() abort
  lua for _, c in pairs(vim.lsp.get_active_clients()) do print(c.name) end
endfunction
function! s:restart_lsp() abort
  lua vim.lsp.stop_client(vim.lsp.get_active_clients())
  edit
endfunction
command! LspClients call s:show_lsp_clients()
command! LspRestart call s:restart_lsp()

lua << EOF

-- https://github.com/neovim/nvim-lspconfig#quickstart
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '[g', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']g', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', 'ga', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, bufopts)
  end,
})

-- https://neovim.io/doc/user/lsp.html
vim.env.PATH = vim.env.PATH .. ':' ..  vim.fn.expand('~/.config/yarn/global/node_modules/.bin')
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*.ts,*.tsx",
  callback = function()
    vim.lsp.start({
      name = 'tsserver',
      cmd = {'typescript-language-server', '--stdio'},
      root_dir = vim.fs.dirname(vim.fs.find({'tsconfig.json'}, { upward = true })[1]),
      diagnostics_format = "#{m} (#{s}: #{c})",
    })
  end
})
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*.ts,*.tsx",
  callback = function()
    vim.lsp.start({
      name = 'eslint',
      cmd = {'vscode-eslint-language-server', '--stdio'},
      root_dir = vim.fs.dirname(vim.fs.find({'.eslintrc.js'}, { upward = true })[1]),
    })
  end
})

vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*.go",
  callback = function()
    vim.lsp.start({
      name = 'gopls',
      cmd = {'gopls'},
      root_dir = vim.fs.dirname(vim.fs.find({'go.mod'}, { upward = true })[1]),
    })
  end
})

vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*.cs",
  callback = function()
    vim.lsp.start({
      name = 'csharp-ls',
      cmd = {'csharp-ls'},
      root_dir = vim.fs.dirname(vim.fs.find({'*.csproj'}, { upward = true })[1]),
      handlers = {
        ["textDocument/definition"] = require('csharpls_extended').handler,
      },
    })
  end
})
EOF
