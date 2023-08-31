local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

-- function vim.lsp.should_format()
--   local clients = vim.lsp.buf_get_clients()
--   if not clients then
--     return false
--   end
--   local formattingClients = {}
--   for _, client in pairs(clients) do
--     if client.name ~= "copilot" then
--       table.insert(formattingClients, client)
--     end
--   end
--
--   return #formattingClients > 0
-- end

-- Language Types ---
vim.cmd("autocmd! BufRead,BufNewFile *.folk set filetype=tcl")

--- FORMATTING ---

-- vim.cmd("autocmd FileType help wincmd L")
-- Open help window in a vertical split to the right.
vim.api.nvim_create_autocmd("BufWinEnter", {
  group = vim.api.nvim_create_augroup("help_window_right", {}),
  pattern = { "*.txt" },
  callback = function()
    if vim.o.filetype == 'help' then vim.cmd.wincmd("L") end
  end
})

-- -- vim.cmd("autocmd BufWritePre * lua vim.lsp.buf.format()")
-- vim.cmd([[
--   autocmd BufWritePre * lua if vim.lsp.should_format() then vim.lsp.buf.format() end
-- ]])

vim.cmd("autocmd FileType gitcommit exec 'au VimEnter * startinsert'")
vim.cmd("autocmd FileType gitcommit imap <C-X> <C-o>:x<CR>")

-- vim.cmd("autocmd! BufEnver )

autocmd('BufEnter', {
  pattern = '',
  command = 'BufferOrderByBufferNumber'
})

-- Don't auto commenting new lines
autocmd('BufEnter', {
  pattern = '',
  command = 'set fo-=c fo-=r fo-=o'
})

-- -- Remove whitespace on save
-- autocmd('BufWritePre', {
--   pattern = '',
--   command = ":%s/\\s\\+$//e"
-- })

-- -- Enter insert mode when switching to terminal
vim.cmd("autocmd! TermOpen * startinsert")
-- vim.cmd("autocmd BufEnter * if &buftype ==# 'terminal' | startinsert! | endif")

-- vim.cmd("autocmd BufWinEnter,WinEnter term://* startinsert")
-- vim.cmd("autocmd BufReadPost * if &buftype ==# 'terminal' | startinsert! | endif")

-- Don't show the status complete when a process exits, just close the window
vim.cmd("autocmd! TermClose * execute 'bdelete! ' . expand('<abuf>')")
