return {
  {
    "mrjones2014/smart-splits.nvim",
    config = function()
      local ss = require("smart-splits")

      ss.setup({
        ignored_filetypes = { "nofile", "quickfix", "prompt" },
        resize_mode = {
          hooks = {
            on_enter = nil,
            on_leave = nil,
          },
        },
      })

      -- Move between splits (Ctrl + h/j/k/l, safe on macOS)
      vim.keymap.set("n", "<C-h>", ss.move_cursor_left)
      vim.keymap.set("n", "<C-j>", ss.move_cursor_down)
      vim.keymap.set("n", "<C-k>", ss.move_cursor_up)
      vim.keymap.set("n", "<C-l>", ss.move_cursor_right)

      -- Resize splits (Option + Arrow, avoids macOS conflict)
      vim.keymap.set("n", "<A-Up>", ss.resize_up)
      vim.keymap.set("n", "<A-Down>", ss.resize_down)
      vim.keymap.set("n", "<A-Left>", ss.resize_left)
      vim.keymap.set("n", "<A-Right>", ss.resize_right)
    end,
  },
}
