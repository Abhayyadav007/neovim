return {
  {
    "folke/snacks.nvim",
    opts = {
      terminal = {
        win = {
          height = 0.5,
        },
      },
      -- Keep your existing dashboard configuration
      dashboard = {
        preset = {
          -- Set the header to a blank string or a multi-line blank string
          -- to remove the ASCII art logo.
          header = "",
        },
      },

      -- *** ADD THIS NOTIFIER CONFIGURATION BLOCK ***
      notifier = {
        -- Set to false to show notifications from bottom-up (bottom-right corner)
        top_down = false,
      },
      -- ********************************************
    },
  },
}
