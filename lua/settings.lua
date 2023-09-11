local set = vim.o
local opt = vim.opt

--- Tabs ---
set.smarttab = true
set.tabstop = 2
set.shiftwidth = 2
set.expandtab = true
set.autoindent = true
set.smartindent = true
set.shiftround = true
set.joinspaces = false
set.iskeyword = '@,48-57,_,192-255'

--- Misc ---
set.number = false
set.relativenumber = false
set.hlsearch = false
-- vim.o.clipboard = 'unnamedplus'
set.ignorecase = true
set.gdefault = false
set.splitright = true
set.shortmess = vim.o.shortmess .. 'O'
set.wrap = true
set.foldlevel = 100
set.history = 1000
set.backspace = 'indent,eol,start'
set.undofile = true
set.undodir = os.getenv("HOME") .. '/.vim/undo'
set.virtualedit = 'all'


-- set sign column to always be around
set.signcolumn = 'yes'

opt.backup = false
opt.writebackup = false
opt.swapfile = false
opt.backupdir = '/tmp'

set.scrolloff = 4
