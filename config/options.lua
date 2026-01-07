-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.diagnostic.config({
  virtual_text = true, -- inline text
  signs = true, -- icons in the gutter
  underline = true, -- squiggly lines under errors
  update_in_insert = false,
  severity_sort = true,
})

vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("data") .. "/undo"
