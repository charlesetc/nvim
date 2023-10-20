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

--- FORMATTING ---

-- These would be useful in certain situations but they
-- conflict with q to exit a buffer
-- map('n', 'qq', 'vipgq', {})
map('i', 'qq', '<C-O>vipgq<C-O>A', {})

-- Better Scrolling in insert mode
map('i', '<C-E>', '<C-X><C-E>', {})
map('i', '<C-Y>', '<C-X><C-Y>', {})

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
map('n', 'M', ':bprev<CR>', {})
map('n', 'm', ':bnext<CR>', {})

-- FINDING MAPPINGS ---
map('n', ',<SPACE>', ':FzfLua<CR>', {})
map('n', ',a', ':FzfLua live_grep<CR>', {})
map('n', ',fc', ':FzfLua commands<CR>', {})
map('n', ',n', ':FzfLua files<CR>', {})
map('n', ',fn', ':GitConflictNext<CR>', {})
map('n', ',fo', ':GitConflictChooseOurs<CR>', {})
map('n', ',ft', ':GitConflictChooseTheirs<CR>', {})
map('n', '<C-R>', ':FzfLua command_history<CR>', {})
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
map('n', ',vp', ':e ~/.config/nvim/lua/snippets.lua<CR>', {})
map('n', ',vc', ':e ~/.config/nvim/lua/color-overrides.lua<CR>', {})
map('n', ',vt', ':e ~/.config/nvim/lua/settings.lua<CR>', {})
map('n', ',vd', ':e ~/.config/nvim/lua/dependencies.lua<CR>', {})
map('n', ',vu', ':e ~/.config/nvim/lua/autocommand.lua<CR>', {})

-- ZSH ---
map('n', ',vz', ':e ~/.zshrc<CR>', {})
map('n', '-', ':e %:h<CR>', {})

map('n', ',,n', ':set invnu<CR>', {})

-- COMMENTS ---
map('n', ',c', ':CommentToggle<CR>', {})
map('v', ',c', ':CommentToggle<CR>', {})

-- QUICKFIXLIST THAT LOOPS!
cmd('command! Cnext try | cnext | catch | cfirst | catch | endtry')
cmd('command! Cprev try | cprev | catch | clast | catch | endtry')
cmd('command! Lnext try | lnext | catch | lfirst | catch | endtry')
cmd('command! Lprev try | lprev | catch | llast | catch | endtry')

--- DIRECTORY NAVIGATION ---
vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })

-- map('n', '\|', ':vsplit<CR>:term<CR>a', {})
map('n', '\\|', ':split<CR><C-w>j:term<CR>a', {})
map('n', ',\\', ':term<CR>a', {})

-- MISC
map('n', 'gf', 'gF', {})

map('n', '<M-[>', 'q:', {})
-- lookup keyword is almost never used, invert J instead

vim.keymap.set({ "n" }, ",tt", function()
  vim.lsp.buf.hover()
end)

vim.keymap.set({ "n" }, ",tn", function()
  vim.lsp.buf.definition()
end)

map('n', 'K', 'i<CR><Esc>R', {})
vim.opt.mouse = 'a'


map('n', ',pr', ':! ampy -p /dev/tty.usbmodem11101 run %<CR>', {})

--- LUA SNIP ---

local ls = require("luasnip")

vim.keymap.set({ "i", "s" }, "<C-K>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })

-- vim.keymap.set({ "i" }, "<C-K>", function() ls.expand() end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-L>", function() ls.jump(1) end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-J>", function() ls.jump(-1) end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-l>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end, { silent = true })

--- LAKE KEYMAP ---

local function file_exists(name)
  local f = io.open(name, "r")
  if f ~= nil then
    io.close(f)
    return true
  else
    return false
  end
end

vim.keymap.set({ "n" }, ",R", function()
  if file_exists("lake.lua") then
    vim.api.nvim_command('botright split')
    vim.api.nvim_command('terminal lua lake.lua')
    vim.api.nvim_command('nnoremap <buffer> q :bdelete<CR>')
    vim.api.nvim_command('nnoremap <buffer> r :bdelete<CR>')
    vim.api.nvim_command('nnoremap <buffer> z :bdelete<CR>')
    vim.api.nvim_command('nnoremap <buffer> ,z :bdelete<CR>')
    vim.api.nvim_command('nnoremap <buffer> ,d :bdelete<CR>')
  elseif file_exists("makefile") or file_exists("Makefile") then
    vim.api.nvim_command('botright split')
    vim.api.nvim_command('terminal make')
    vim.api.nvim_command('nnoremap <buffer> q :bdelete<CR>')
    vim.api.nvim_command('nnoremap <buffer> r :bdelete<CR>')
    vim.api.nvim_command('nnoremap <buffer> z :bdelete<CR>')
    vim.api.nvim_command('nnoremap <buffer> ,z :bdelete<CR>')
    vim.api.nvim_command('nnoremap <buffer> ,d :bdelete<CR>')
  else
    print('neither lake.lua or makefile where found')
  end
end)

--- EXPECT TEST KEYMAP ---

function Quit_term()
    local job_id = vim.fn.getbufvar("%", "terminal_job_id")
    vim.fn.jobstop(job_id)
end

vim.keymap.set({"n"}, ",r", function()
  vim.cmd("vsplit | terminal bash -c 'lua lake.lua | less'")

  vim.keymap.set({'i', 't'}, "a", function()
    Quit_term()
    vim.cmd("terminal bash -c 'lua lake.lua accept'")
    vim.cmd.sleep("50m")
    vim.cmd.bufdo("checktime")
  end, { silent = true, buffer = true, })

  vim.keymap.set({'t'}, "<space>", Quit_term , { silent = true, buffer = true, })
  vim.keymap.set({'t'}, "q", Quit_term , { silent = true, buffer = true, })

end, {
  silent = true,
})

--- GIT KEYMAP ---

local function shared_git_keymaps()
  vim.keymap.set({'t', 'n'}, "q", Quit_term, { silent = true, buffer = true, })
  vim.keymap.set({'t', 'n'}, "<space>", Quit_term, { silent = true, buffer = true, })
  vim.keymap.set({'t', 'n'}, "c", function()
    Quit_term()
    Git_commit()
  end, { silent = true, buffer = true, })
end

local function normal_mode()
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, true, true), 'n', true)
end

local function chain(...)
  local fns = {...}
  return function(...)
    for _, f in ipairs(fns) do
      f(...)
    end
  end
end

function Git_commit()
  -- -- first prompt for user input for the commit message, then run the commit
  -- local message = vim.fn.input("message: ")
  -- local message = string.gsub(message, '"', '\\"')
  -- dofile("/Users/charles/.lua/init.lua")
  -- vim.cmd("terminal bash -c 'git commit -am \\\"" .. message .. "\\\" |& less'")
end

function Git_diff_mode()
  vim.cmd("vsplit | terminal bash -c 'git diff | less'")
  shared_git_keymaps()
  vim.keymap.set({'t', 'n'}, "m", chain(Quit_term, Git_status_mode) , { silent = true, buffer = true, })
end

function Git_diff_file(file)
  vim.cmd(string.format("vsplit | terminal bash -c 'git diff %s | less'", file))
  shared_git_keymaps()
  vim.keymap.set({'t', 'n'}, "m", function()
    Quit_term()
    Git_status_mode()
  end, { silent = true, buffer = true, })
  vim.keymap.set({'t', 'n'}, "<CR>", function()
    Quit_term()
    Git_status_mode()
  end, { silent = true, buffer = true, })
end

local function parse_git_status_line(line)
    -- drop the first space if it exists
    if string.sub(line, 1, 1) == " " then
      line = string.sub(line, 2)
    end
    -- get everything after the first space
    local file = string.sub(line, string.find(line, " ") + 1)
    return file
end

function Git_status_mode()
  vim.cmd("vsplit | terminal bash -c 'git status -s | less'")
  normal_mode()
  shared_git_keymaps()
  vim.keymap.set({'t', 'n'}, "m", function()
    Quit_term()
    Git_diff_mode()
  end, { silent = true, buffer = true, })

  vim.keymap.set({'t', 'n'}, "<CR>", function()
    -- get current line
    local line = vim.api.nvim_get_current_line()
    local file = parse_git_status_line(line)
    Quit_term()
    Git_diff_file(file)
  end, { silent = true, buffer = true, })
end

vim.keymap.set({ "n" }, ",m", Git_diff_mode, { silent = true })
