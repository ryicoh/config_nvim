
let $PATH = $PATH . ':' .  expand('~/.config/yarn/global/node_modules/.bin')
lua << EOF

local lspconfig = require("lspconfig")

lspconfig.vimls.setup{}
lspconfig.gopls.setup{ settings = { gopls = {
    hints = {
      assignVariableTypes= true,
      functionTypeParameters= true,
      compositeLiteralFields= true,
      parameterNames= true,
    },
  },
}}

lspconfig.jdtls.setup {}
lspconfig.vuels.setup{}

lspconfig.vtsls.setup { settings = {
  typescript = {
    -- inlayHints = {
    --   parameterNames = { enabled = 'all' },
    --   parameterTypes = { enabled = true },
    -- },
  },
}}

-- vim.api.nvim_create_autocmd('LspAttach', {
--   group = vim.api.nvim_create_augroup('UserLspConfig', {}),
--   callback = function(ev)
--     local client = vim.lsp.get_client_by_id(ev.data.client_id)
--     client.server_capabilities.semanticTokensProvider = nil
--     if client.supports_method('textDocument/inlayHint') then
--       vim.lsp.buf.inlay_hint(ev.buf, true)
--       vim.api.nvim_set_hl(0, 'LspInlayHint', { link = 'DiagnosticHint' })
--     else
--     end
--   end,
-- })
EOF

nnoremap ga <Cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap gr <Cmd>lua vim.lsp.buf.references()<CR>
nnoremap <leader>rn :<C-u>lua vim.lsp.buf.rename('')<Left><Left>
nnoremap <leader>f <Cmd>lua vim.lsp.buf.format()<CR>
nnoremap <leader>q <Cmd>lua vim.diagnostic.setqflist()<CR>
nnoremap [g <Cmd>lua vim.diagnostic.goto_prev()<CR>
nnoremap ]g <Cmd>lua vim.diagnostic.goto_next()<CR>
nnoremap [d <Cmd>lua vim.diagnostic.goto_prev()<CR>
nnoremap ]d <Cmd>lua vim.diagnostic.goto_next()<CR>

