local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

-- Language Types ---
vim.cmd("autocmd! BufRead,BufNewFile *.folk set filetype=tcl")

--- Formatting ---
vim.cmd("autocmd FileType help wincmd L")
-- vim.cmd("autocmd BufWritePre * lua vim.lsp.buf.format()")
vim.cmd([[
  autocmd BufWritePre * lua if vim.lsp.buf_get_clients() ~= nil then vim.lsp.buf.format() end
]])

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
-- autocmd('TermOpen', {
--   command = 'setlocal listchars= nonumber norelativenumber nocursorline',
-- })
--
-- autocmd('TermOpen', {
--   pattern = '',
--   command = 'startinsert'
-- })
--
-- Close terminal buffer on process exit
-- (useful for the make terminal, might not be great for one-off commands)

-- vim.api.nvim_create_autocmd('BufLeave', {
--   pattern = 'term://*',
--   command = 'stopinsert'
-- })
