--- PREFACE ---

local cmd = vim.cmd
local fn = vim.fn
local g = vim.g
local opt = vim.opt


--- PACKER ---

local ensure_packer = function()
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  print(install_path)
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end


local packer_bootstrap = ensure_packer()

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use { 'kevinhwang91/nvim-bqf' }
  use 'romgrk/barbar.nvim'

  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  }

  use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup()
    end
  })

  use { "zbirenbaum/copilot.lua" }

  use { 'nvim-pack/nvim-spectre' }
  use { 'echasnovski/mini.pairs' }
  use { 'mattn/vim-gist', requires = 'mattn/webapi-vim' }

  use { 'stevearc/oil.nvim' }


  use { "catppuccin/nvim", as = "catppuccin" }
  use { "nvim-telescope/telescope.nvim", requires = { { "nvim-lua/plenary.nvim" } }, }
  use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
  use 'terrortylor/nvim-comment'

  use { 'akinsho/git-conflict.nvim' }

  use { 'lewis6991/gitsigns.nvim' }

  use { 'windwp/nvim-ts-autotag' }

  use "rafamadriz/friendly-snippets"

  -- CMP & LUASNIP --

  use "neovim/nvim-lspconfig"
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use { "L3MON4D3/LuaSnip", requires = "rafamadriz/friendly-snippets" }
  use { 'hrsh7th/nvim-cmp' }
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use 'cormacrelf/dark-notify'
  use 'nvimdev/guard.nvim'

  use {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup {
        -- your configuration comes hereettings
        -- refer to the configuration section below
      }
    end
  }

  use {
    "benfowler/telescope-luasnip.nvim",
  }


  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

--- CMP COMPLETION ---

local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      require 'luasnip'.lsp_expand(args.body)
    end
  },

  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    -- more sources
  },

  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      -- behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif require('luasnip').expand_or_jumpable() then
        require('luasnip').expand_or_jump()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif require('luasnip').jumpable(-1) then
        require('luasnip').jump(-1)
      else
        fallback()
      end
    end,
  },
}



--- COMMENTS ---
require('nvim_comment').setup()


-- FIND AND REPLACE ---
require('spectre').setup()

--- COLORS ---

vim.cmd.colorscheme "catppuccin-latte"
-- vim.o.background = "dark"

--- DIRECTORY NAVIGATION ---

require("oil").setup()

--- LSP ---

local lspconfig = require('lspconfig')

lspconfig.tsserver.setup {}
-- lspconfig.html.setup {}
lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}
lspconfig.pyright.setup {}

-- Add additional capabilities supported by nvim-cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local servers = { 'clangd', 'rust_analyzer', 'pyright', 'tsserver', 'ocamllsp' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    capabilities = capabilities,
  }
end


--- FORMATTING ---

local guard = require('guard.filetype')

guard('python')
    :fmt({
      cmd = 'black',
      args = { '--quiet', '-' },
      stdin = true
    })

-- Call setup() LAST!
require('guard').setup({
  -- the only options for the setup function
  fmt_on_save = true,
  -- Use lsp if no formatter was defined for this filetype
  lsp_as_default_formatter = true,
})

--- TABLINE ---

require('barbar').setup {
  icons = {
    preset = "powerline",
    button = " ",
    filetype = {
      enabled = false
    },
  }
}

--- GIT ---

local neogit = require('neogit')
neogit.setup {
  disable_insert_on_commit = false,
  disable_commit_confirmation = true,
}

require('gitsigns').setup()


require('git-conflict').setup()

--- AUTO PAIRING ---

require('mini.pairs').setup({
  modes = { insert = true, command = false, terminal = false },
  mappings = {
    ['('] = { action = 'open', pair = '()', neigh_pattern = '[^\\][ \t\n\r]' },
    ['['] = { action = 'open', pair = '[]', neigh_pattern = '[^\\][ \t\n\r]' },
    ['{'] = { action = 'open', pair = '{}', neigh_pattern = '[^\\][ \t\n\r]' },

    [')'] = { action = 'close', pair = '()', neigh_pattern = '[^\\].' },
    [']'] = { action = 'close', pair = '[]', neigh_pattern = '[^\\].' },
    ['}'] = { action = 'close', pair = '{}', neigh_pattern = '[^\\].' },

    ['"'] = { action = 'closeopen', pair = '""', neigh_pattern = '[^\\][ \t\n\r]', register = { cr = false } },
    ["'"] = { action = 'closeopen', pair = "''", neigh_pattern = '[^%a\\][ \t\n\r]', register = { cr = false } },
    ['`'] = { action = 'closeopen', pair = '``', neigh_pattern = '[^\\][ \t\n\r]', register = { cr = false } },
  },
}
)

--- TELESCOPE ---

local telescope = require("telescope")
local telescope_actions = require("telescope.actions")
telescope.setup {
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = telescope_actions.close,
      },
    },
  },
}

telescope.load_extension('luasnip')

--- COPILOT ---

require("copilot").setup({})

--- TREESITTER ---

require 'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "vim", "vimdoc", "ocaml" },
  autotag = {
    enable = true,
  },
  auto_install = true,
  highlight = {
    enable = true,
  }
}

--- AUTO DARK THEME ---

require('dark_notify').run()

--- LUA SNIPPETS ---

local ls = require 'luasnip'

ls.config.set_config {
  history = true,
  updateevents = "TextChanged,TextChangedI",
  enable_autosnippets = true,
}

require("luasnip.loaders.from_vscode").lazy_load()
