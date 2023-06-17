--- Language Types ---
vim.cmd("autocmd! BufRead,BufNewFile *.folk set filetype=tcl")

--- Formatting ---
vim.cmd("autocmd BufWritePre * lua vim.lsp.buf.format()")
vim.cmd("autocmd FileType help wincmd L")
