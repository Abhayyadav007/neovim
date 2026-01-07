-- ~/.config/nvim/lua/config/lazy.lua

-- Path to lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Clone lazy.nvim if it's not installed
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    lazyrepo,
    lazypath,
  })
end

-- Prepend lazy.nvim to runtime path
vim.opt.rtp:prepend(lazypath)

-- Persistent colorscheme module
local Colors = require("config.colorscheme")

-- Override vim.cmd.colorscheme to automatically save any changes
do
  local original_colorscheme = vim.cmd.colorscheme
  vim.cmd.colorscheme = function(name)
    original_colorscheme(name) -- apply the theme
    Colors.save(name) -- save it persistently
  end
end

-- Load LazyVim and plugins
require("lazy").setup({
  spec = {
    -- LazyVim core
    {
      "LazyVim/LazyVim",
      import = "lazyvim.plugins",
    },
    -- Your custom plugins
    { import = "plugins" },
  },

  -- Defaults
  defaults = {
    lazy = false, -- load custom plugins at startup
    version = false, -- always use latest git commit
  },

  -- Fallback colorschemes
  install = {
    colorscheme = { "tokyonight-night" },
  },

  -- Plugin update checker
  checker = {
    enabled = true,
    notify = false,
  },

  -- Performance optimizations
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})

-- Load the last saved colorscheme after LazyVim is ready
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    Colors.load()
  end,
})

-- Optional: override :Colorscheme to auto-save selections manually
vim.api.nvim_create_user_command("Colorscheme", function(opts)
  vim.cmd.colorscheme(opts.args)
  Colors.save(opts.args)
end, { nargs = 1 })

--[[ 
Plugin Updates:
- lazy.nvim        : Plugin manager
- LazyVim          : Neovim starter config
- tokyonight       : Default dark colorscheme
- habamax          : Default light colorscheme
--]]
