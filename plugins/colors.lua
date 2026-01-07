return {
  -- Inline color highlights
  {
    "norcalli/nvim-colorizer.lua",
    lazy = false,
    config = function()
      require("colorizer").setup({
        "*",
        css = { css = true },
        html = { names = true },
        javascript = { names = true },
      })
    end,
  },

  -- Interactive color picker (like VS Code)
  {
    "uga-rosa/ccc.nvim",
    lazy = false,
    config = function()
      local ccc = require("ccc")
      local mapping = ccc.mapping
      local input = ccc.input
      local output = ccc.output

      ccc.setup({
        highlighter = {
          auto_enable = true,
          lsp = true,
        },
        pickers = {
          ccc.picker.hex, -- enable hex colors
          ccc.picker.rgb, -- enable rgb colors
        },
        mappings = {
          ["<Left>"] = mapping.decrease1,
          ["<Right>"] = mapping.increase1,
          ["<Up>"] = mapping.increase10,
          ["<Down>"] = mapping.decrease10,
          ["q"] = mapping.quit,
          ["<CR>"] = mapping.complete,
        },
      })

      -- shortcut to open color picker
      vim.keymap.set("n", "<leader>cp", "<cmd>CccPick<CR>", { desc = "🎨 Pick Color" })
      -- shortcut to edit color under cursor (like VS Code hover)
      vim.keymap.set("n", "<leader>ce", "<cmd>CccEdit<CR>", { desc = "🎨 Edit Color Under Cursor" })
    end,
  },
}
