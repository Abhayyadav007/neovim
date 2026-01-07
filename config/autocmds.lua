-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Preserve undo history across autosaves
vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    -- Only join undo if the buffer is modifiable and not read-only
    if vim.bo.modifiable then
      pcall(vim.cmd, "silent! undojoin")
    end
  end,
})

-- vim.api.nvim_create_autocmd("LspAttach", {
--   callback = function(args)
--     local client = vim.lsp.get_client_by_id(args.data.client_id)
--     local buf = args.buf
--     if client.name == "html" and vim.bo[buf].filetype == "ejs" then
--       vim.lsp.stop_client(client.id)
--     end
--   end,
-- })

vim.api.nvim_create_autocmd("CursorHold", {
  pattern = "*",
  callback = function()
    local word = vim.fn.expand("<cword>")
    if word:match("^#%x%x%x%x%x%x$") then
      vim.cmd("CccEdit")
    end
  end,
})
