--- TERMINAL-MODE MAPPINGS ---
local fn = vim.fn
local api = vim.api
local cmd = vim.cmd
local map = api.nvim_set_keymap

if fn.has('nvim') == 1 then
  map('t', '<esc>', '<C-\\><C-n>', {})
  map('t', 'yw', '<C-\\><C-n>', {})
  map('t', ',h', '<C-\\><C-n><C-w>h', {})
  map('t', ',l', '<C-\\><C-n><C-w>l', {})
end

--- INSERT-MODE MAPPINGS ---
map('i', 'yw', '<esc>', {})
map('i', 'y,w', '<esc>', {})
map('i', 'Yw', '<esc>', {})
map('i', 'YW', '<esc>', {})
map('i', 'yW', '<esc>', {})
map('i', '-.', '.->', {})
map('i', ',.', '<C-X><C-O>', {})

--- ALL-MODE MAPPINGS ---
map('', '<space>', ':', {})
api.nvim_set_var('mapleader', ',')
api.nvim_set_var('maplocalleader', ',')
api.nvim_set_option('clipboard', 'unnamed')

-- PANE MOVEMENT ---
map('n', ',h', '<C-w>h', {})
map('n', ',j', '<C-w>j', {})
map('n', ',k', '<C-w>k', {})
map('n', ',l', '<C-w>l', {})
map('n', ',H', '<C-w>H', {})
map('n', ',J', '<C-w>J', {})
map('n', ',K', '<C-w>K', {})
map('n', ',L', '<C-w>L', {})
map('n', ',o', ':only<CR>', {})
map('n', ',i', ':vsplit<CR>', {})
map('n', ',e', ':split<CR>', {})

--- GIT ---

map('n', ',g', ':Neogit<CR>', {})

-- WINDOWS AND BUFFERS ---
map('n', ',<ESC>', ':close<CR>', {})
map('n', ',b', ':q<CR>', {})
map('n', ',d', '<C-w>j:close<CR>', {})
map('n', '<C-h>', '<w>h:close<CR>', {})
map('n', '<C-l>', '<C-w>l:close<CR>', {})
map('n', ',D', '<C-w>k:close<CR>', {})
map('n', ',z', ':bdelete!<CR>', {})
map('n', ',w', ':w<CR>', {})
map('n', ',x', ':x<CR>', {})
map('n', ',q', ':qa!<CR>', {})
map('n', ',b', ':q<CR>', {})
map('n', 'm', ':bn<CR>', {})
map('n', 'M', ':bp<CR>', {})

-- FINDING MAPPINGS ---
map('n', ',t', ':Telescope<CR>', {})
map('n', ',<SPACE>', ':Buffers<CR>', {})
map('n', ',a', ':Telescope live_grep<CR>', {})
map('n', 'gl', ':Telescope lsp_document_symbols<CR>', {})
map('n', ',n', ':Telescope find_files<CR>', {})
map('n', ',fc', ':Commands<CR>', {})
map('n', '<C-R>', ':Telescope command_history<CR>', {})
map('n', 'U', ':redo<CR>', {})

-- SCROLLING ---
map('n', '<PageUp>', '<C-u>', {})
map('n', '<PageDown>', '<C-d>', {})
map('n', '<Page-Up>', '<C-u>', {})
map('n', '<Page-Down>', '<C-d>', {})
map('n', '<Home>', 'gg', {})
map('n', '<End>', 'G', {})
map('n', '[', '{', {})
map('n', ']', '}', {})

-- VISUAL ---
map('n', 'vv', 'V', {})
map('v', 'm', 'gq$', {})
map('v', '<', '<gv', {})
map('v', '>', '>gv', {})
map('v', '<Left>', '<gv', {})
map('v', '<Right>', '>gv', {})

map('n', ',s', ':%s//g<Left><Left>', {})
map('n', ',S', ':s//g<Left><Left>', {})
map('v', ',s', ':s//g<Left><Left>', {})

-- REFORMAT ENTIRE PARAGRAPH ---
map('n', '==', 'm9vip=g`9', {})

-- CASE SENSITIVE SEARCH ---
map('n', 'c/', '/\\C', {})

-- META ---
map('n', ',vs', ':so ~/.config/nvim/init.lua<CR>', {})
map('n', ',vv', ':e ~/.config/nvim/init.lua<CR>', {})
map('n', ',vm', ':e ~/.config/nvim/lua/maps.lua<CR>', {})
map('n', ',vt', ':e ~/.config/nvim/lua/settings.lua<CR>', {})
map('n', ',vd', ':e ~/.config/nvim/lua/dependencies.lua<CR>', {})
map('n', ',vu', ':e ~/.config/nvim/lua/autocommand.lua<CR>', {})

-- ZSH ---
map('n', ',vz', ':e ~/.zshrc<CR>', {})
map('n', '-', ':e %:h<CR>', {})

map('n', ',,n', ':set nu<CR>', {})
map('n', ',,N', ':set nonu<CR>', {})

-- COMMENTS ---
map('n', ',c', ':CommentToggle<CR>', {})
map('v', ',c', ':CommentToggle<CR>', {})

-- QUICKFIXLIST THAT LOOPS!
cmd('command! Cnext try | cnext | catch | cfirst | catch | endtry')
cmd('command! Cprev try | cprev | catch | clast | catch | endtry')
cmd('command! Lnext try | lnext | catch | lfirst | catch | endtry')
cmd('command! Lprev try | lprev | catch | llast | catch | endtry')

-- map('n', '\|', ':vsplit<CR>:term<CR>a', {})
map('n', '\\|', ':split<CR><C-w>j:term<CR>a', {})
map('n', ',\\', ':term<CR>a', {})

-- MISC
map('n', 'gf', 'gF', {})
map('n', '<M-[>', 'q:', {})
-- lookup keyword is almost never used, invert J instead
map('n', 'K', 'i<CR><Esc>R', {})
vim.opt.mouse = 'a'
