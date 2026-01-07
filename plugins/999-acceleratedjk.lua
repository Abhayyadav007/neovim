return {
  "rhysd/accelerated-jk",
  lazy = false,
  priority = 1000,
  config = function()
    vim.defer_fn(function()
      vim.keymap.set("n", "j", "<Plug>(accelerated_jk_gj)", { noremap = true, silent = true })
      vim.keymap.set("n", "k", "<Plug>(accelerated_jk_gk)", { noremap = true, silent = true })
    end, 0)
  end,
}
