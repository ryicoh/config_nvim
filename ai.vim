let g:vim_ai_chat = {
\  "options": {
\    "model": "gpt-3.5-turbo",
\    "temperature": 0.2,
\  },
\}

imap <C-\> <Cmd>Copilot panel<CR>

nnoremap <leader>a <Cmd>AI<CR>
xnoremap <leader>a <Cmd>AI<CR>

xnoremap <leader>s <Cmd>AIEdit fix grammar and spelling<CR>
nnoremap <leader>s <Cmd>AIEdit fix grammar and spelling<CR>

xnoremap <leader>e <C-u>:>AIEdit<Space>

xnoremap <leader>c <Cmd>AIChat<CR>
nnoremap <leader>c <Cmd>AIChat<CR>

nnoremap <leader>n <Cmd>AINewChat<CR>

