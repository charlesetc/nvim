
------- Terminal-mode mappings -------
if vim.fn.has('nvim') == 1 then
  vim.api.nvim_set_keymap('t', '<esc>', '<C-\\><C-n>', {})
  vim.api.nvim_set_keymap('t', 'yw', '<C-\\><C-n>', {})
  vim.api.nvim_set_keymap('t', ',h', '<C-\\><C-n><C-w>h', {})
  vim.api.nvim_set_keymap('t', ',l', '<C-\\><C-n><C-w>l', {})
end

-- ===== Insert-mode mappings =====
vim.api.nvim_set_keymap('i', 'yw', '<esc>', {})
vim.api.nvim_set_keymap('i', 'y,w', '<esc>', {})
vim.api.nvim_set_keymap('i', 'Yw', '<esc>', {})
vim.api.nvim_set_keymap('i', 'YW', '<esc>', {})
vim.api.nvim_set_keymap('i', 'yW', '<esc>', {})
vim.api.nvim_set_keymap('i', '-.', '.->', {})
vim.api.nvim_set_keymap('i', ',.', '<C-X><C-O>', {})

-- ===== All-mode mappings =====
vim.api.nvim_set_keymap('', '<space>', ':', {})
vim.api.nvim_set_var('mapleader', ',.')
vim.api.nvim_set_var('maplocalleader', ',.')
vim.api.nvim_set_option('clipboard', 'unnamed')

-- ===== Normal mappings =====
-- CoC
vim.api.nvim_set_keymap('n', '<silent> <Tab>', ':call CocAction("doHover")<CR>', {})
vim.api.nvim_set_keymap('n', ']y', ':CocFirst diagnostics<CR>', {})
vim.api.nvim_set_keymap('n', '[;', ':CocNext diagnostics<CR>', {})
vim.api.nvim_set_var('b:coc_diagnostic_disable', 1)
vim.api.nvim_set_var('g:SuperTabDefaultCompletionType', '<c-n>')

-- Pane movement
vim.api.nvim_set_keymap('n', ',h', '<C-w>h', {})
vim.api.nvim_set_keymap('n', ',j', '<C-w>j', {})
vim.api.nvim_set_keymap('n', ',k', '<C-w>k', {})
vim.api.nvim_set_keymap('n', ',l', '<C-w>l', {})
vim.api.nvim_set_keymap('n', ',H', '<C-w>H', {})
vim.api.nvim_set_keymap('n', ',J', '<C-w>J', {})
vim.api.nvim_set_keymap('n', ',K', '<C-w>K', {})
vim.api.nvim_set_keymap('n', ',L', '<C-w>L', {})
vim.api.nvim_set_keymap('n', ',o', ':only<CR>', {})
vim.api.nvim_set_keymap('n', ',i', ':vsplit<CR>', {})
vim.api.nvim_set_keymap('n', ',e', ':split<CR>', {})

-- Windows and buffers
vim.api.nvim_set_keymap('n', ',<ESC>', ':close<CR>', {})
vim.api.nvim_set_keymap('n', ',b', ':q<CR>', {})
vim.api.nvim_set_keymap('n', ',d', '<C-w>j:close<CR>', {})
vim.api.nvim_set_keymap('n', '<C-h>', '<w>h:close<CR>', {})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l:close<CR>', {})
vim.api.nvim_set_keymap('n', ',D', '<C-w>k:close<CR>', {})
vim.api.nvim_set_keymap('n', ',z', ':bdelete!<CR>', {})
vim.api.nvim_set_keymap('n', ',w', ':w<CR>', {})
vim.api.nvim_set_keymap('n', ',x', ':x<CR>', {})
vim.api.nvim_set_keymap('n', ',q', ':qa!<CR>', {})
vim.api.nvim_set_keymap('n', ',b', ':q<CR>', {})
vim.api.nvim_set_keymap('n', 'm', ':bn<CR>', {})
vim.api.nvim_set_keymap('n', 'M', ':bp<CR>', {})

-- FZF mappings
vim.api.nvim_set_keymap('n', ',B', ':Buffers<CR>', {})
vim.api.nvim_set_keymap('n', ',<SPACE>', ':Buffers<CR>', {})
vim.api.nvim_set_keymap('n', ',a', ':Rg<CR>', {})
vim.api.nvim_set_keymap('n', ',A', ':Lines<CR>', {})
vim.api.nvim_set_keymap('n', ',n', ':Files<CR>', {})
vim.api.nvim_set_keymap('n', ',fc', ':Commands<CR>', {})
vim.api.nvim_set_keymap('n', ',W', ':Windows<CR>', {})
vim.api.nvim_set_keymap('n', ',N', ':History<CR>', {})
vim.api.nvim_set_keymap('n', '<C-R>', ':History:<CR>', {})
vim.api.nvim_set_keymap('n', 'U', ':redo<CR>', {})

-- Scrolling
vim.api.nvim_set_keymap('n', '<PageUp>', '<C-u>', {})
vim.api.nvim_set_keymap('n', '<PageDown>', '<C-d>', {})
vim.api.nvim_set_keymap('n', '<Page-Up>', '<C-u>', {})
vim.api.nvim_set_keymap('n', '<Page-Down>', '<C-d>', {})
vim.api.nvim_set_keymap('n', '<Home>', 'gg', {})
vim.api.nvim_set_keymap('n', '<End>', 'G', {})
vim.api.nvim_set_keymap('n', '[', '{', {})
vim.api.nvim_set_keymap('n', ']', '}', {})

-- Visual
vim.api.nvim_set_keymap('n', 'vv', 'V', {})
vim.api.nvim_set_keymap('v', 'm', 'gq$', {})
vim.api.nvim_set_keymap('v', '<', '<gv', {})
vim.api.nvim_set_keymap('v', '>', '>gv', {})
vim.api.nvim_set_keymap('v', '<Left>', '<gv', {})
vim.api.nvim_set_keymap('v', '<Right>', '>gv', {})

vim.api.nvim_set_keymap('n', ',s', ':%s//g<Left><Left>', {})
vim.api.nvim_set_keymap('n', ',S', ':s//g<Left><Left>', {})
vim.api.nvim_set_keymap('v', ',s', ':s//g<Left><Left>', {})

-- Reformat entire paragraph
vim.api.nvim_set_keymap('n', '==', 'm9vip=g`9', {})

-- Case Sensitive Search
vim.api.nvim_set_keymap('n', 'c/', '/\\C', {})

-- Meta
vim.api.nvim_set_keymap('n', ',vs', ':so ~/.vimrc<CR>', {})
vim.api.nvim_set_keymap('n', ',vv', ':e ~/.vimrc<CR>', {})
vim.api.nvim_set_keymap('n', ',vm', ':e ~/.vim/plugin/charles/map.vim<CR>', {})
vim.api.nvim_set_keymap('n', ',vj', ':so ~/.vimrc<CR>', {})


-- Zsh
vim.api.nvim_set_keymap('n', ',vz', ':e ~/.zshrc<CR>', {})
vim.api.nvim_set_keymap('n', '-', ':e %:h<CR>', {})

vim.api.nvim_set_keymap('n', ',,n', ':set nu<CR>', {})
vim.api.nvim_set_keymap('n', ',,N', ':set nonu<CR>', {})

-- Comments
-- vim.api.nvim_set_keymap('n', ',c', ':call NERDComment("n", "toggle")<cr>', {})
-- vim.api.nvim_set_keymap('v', ',c', ':call NERDComment("v", "toggle")<cr>', {})
-- vim.api.nvim_set_keymap('n', ',C', ':call NERDComment("n", "minimal")<cr>', {})
-- vim.api.nvim_set_keymap('v', ',C', ':call NERDComment("v", "minimal")<cr>', {})
-- vim.g.NERDTrimTrailingWhitespace = 1

-- Quickfixlist that loops!
vim.cmd('command! Cnext try | cnext | catch | cfirst | catch | endtry')
vim.cmd('command! Cprev try | cprev | catch | clast | catch | endtry')
vim.cmd('command! Lnext try | lnext | catch | lfirst | catch | endtry')
vim.cmd('command! Lprev try | lprev | catch | llast | catch | endtry')

-- vim.api.nvim_set_keymap('n', '\|', ':vsplit<CR>:term<CR>a', {})
vim.api.nvim_set_keymap('n', '\\|', ':split<CR><C-w>j:term<CR>a', {})
vim.api.nvim_set_keymap('n', ',\\', ':term<CR>a', {})

-- Misc

vim.api.nvim_set_keymap('n', 'gf', 'gF', {})
vim.api.nvim_set_keymap('n', '<M-[>', 'q:', {})
-- lookup keyword is almost never used, invert J instead
vim.api.nvim_set_keymap('n', 'K', 'i<CR><Esc>R', {})
vim.opt.mouse = 'a'
