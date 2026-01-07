return {
  "pocco81/auto-save.nvim",
  config = function()
    require("auto-save").setup({
      enabled = true, -- autosave on by default
      execution_message = {
        message = function()
          return "💾 AutoSaved at " .. vim.fn.strftime("%H:%M:%S")
        end,
        dim = 0.18,
        cleaning_interval = 1250,
      },
      trigger_events = { "InsertLeave", "TextChanged" },
    })

    -- Keymap to toggle autosave
    vim.keymap.set("n", "<leader>ass", function()
      vim.cmd("ASToggle")
    end, { desc = "Toggle AutoSave" })
  end,
}
