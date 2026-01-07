return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    lazy = false,
    config = function()
      require("toggleterm").setup({
        open_mapping = nil, -- we use custom keymaps instead
        direction = "float",
        start_in_insert = true,
        shade_terminals = false,
        highlights = {
          NormalFloat = { link = "Normal" },
          Normal = { link = "Normal" },
        },
        float_opts = {
          border = "curved",
          highlights = {
            border = "Normal",
            background = "Normal",
          },
        },
        size = function(term)
          if term.direction == "horizontal" then
            return 15
          elseif term.direction == "vertical" then
            return vim.o.columns * 0.3
          end
        end,
      })

      -- Default toggle (uses last active terminal or creates #1)
      vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<cr>", { desc = "ToggleTerm (default)" })

      -- Specific terminals with counts
      vim.keymap.set("n", "<leader>t1", "<cmd>1ToggleTerm<cr>", { desc = "ToggleTerm #1" })
      vim.keymap.set("n", "<leader>t2", "<cmd>2ToggleTerm<cr>", { desc = "ToggleTerm #2" })
      vim.keymap.set("n", "<leader>t3", "<cmd>3ToggleTerm<cr>", { desc = "ToggleTerm #3" })

      -- Direction-specific (you can also add counts to these, e.g. <leader>tf becomes 1<leader>tf for #1 float)
      vim.keymap.set("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", { desc = "ToggleTerm (Float)" })
      vim.keymap.set(
        "n",
        "<leader>th",
        "<cmd>ToggleTerm direction=horizontal<cr>",
        { desc = "ToggleTerm (Horizontal)" }
      )
      vim.keymap.set("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>", { desc = "ToggleTerm (Vertical)" })

      -- Bonus: Toggle ALL open terminals at once
      vim.keymap.set("n", "<leader>tA", "<cmd>ToggleTermToggleAll<cr>", { desc = "Toggle All Terminals" })
    end,
  },
}
