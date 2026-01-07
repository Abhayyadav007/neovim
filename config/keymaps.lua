-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Neo-tree keymap
vim.keymap.set("n", "<leader>o", "<cmd>Neotree toggle<CR>", { desc = "Toggle Neo-tree" })

-- Custom Insert Mode: 'aio' to escape to Normal mode
vim.keymap.set("i", "aio", "<Esc>", { noremap = true, silent = true, desc = "Escape with aio" })

-- Quick splits
vim.keymap.set("n", "<Leader>sh", ":split<CR>")
vim.keymap.set("n", "<Leader>sv", ":vsplit<CR>")

vim.keymap.set("n", "j", "<Plug>(accelerated_jk_gj)", { noremap = true, silent = true })
vim.keymap.set("n", "k", "<Plug>(accelerated_jk_gk)", { noremap = true, silent = true })

-- Normal mode: open / close
vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<cr>", { desc = "ToggleTerm" })

-- Terminal mode: close with the same key
vim.keymap.set("t", "<leader>tt", function()
  vim.cmd("ToggleTerm")
end, { desc = "ToggleTerm (close)" })

-- Normal mode: open/close toggleterm
vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<cr>", { desc = "ToggleTerm" })

-- Terminal mode: go to Normal mode (single-press escape)
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { desc = "Term: go to Normal mode" })

-- Terminal mode: alternative two-key combo 'jk' to go to Normal mode
vim.keymap.set("t", "aio", [[<C-\><C-n>]], { desc = "Term: go to Normal mode (jk)" })

-- Terminal mode: close the toggleterm with leader (use <Space>tt while in terminal)
vim.keymap.set("t", "<leader>tt", [[<C-\><C-n><cmd>ToggleTerm<cr>]], { desc = "ToggleTerm (close)" })
