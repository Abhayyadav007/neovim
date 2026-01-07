return {
  -- 1. Plugin Specification
  "rest-nvim/rest.nvim",

  -- 2. Dependencies & Lazy Loading
  -- 'ft = { "http", "rest" }' ensures the plugin only loads when you open an .http or .rest file, keeping startup fast.
  ft = { "http", "rest" },
  dependencies = {
    -- Plenary is a common dependency for Neovim Lua plugins
    "lalitmee/browse.nvim",
    "nvim-lua/plenary.nvim",
  },

  config = function()
    vim.g.rest_nvim = {
      result_split_in_place = true,
      result_buf_auto_close = true,
      -- ... (Keep any other setup options you like here)
      post_run = function(result)
        local bufnr = result.result_buffer

        if vim.bo[bufnr].filetype == "json" or vim.bo[bufnr].filetype == "jsonc" then
          -- 1. Ensure 'jq' is available before attempting to format
          if vim.fn.executable("jq") == 1 then
            -- 💥 FIX: Set buffer to modifiable using the modern API
            vim.api.nvim_set_option_value("modifiable", true, { buf = bufnr })

            -- 2. Ensure formatprg is set to 'jq .'
            -- RECOMMENDED
            vim.api.nvim_set_option_value("formatprg", "jq .", { buf = bufnr })

            -- 3. Run the Neovim formatting command (gggqG formats the whole buffer)
            vim.cmd(bufnr .. " normal gggqG")

            -- 4. Set the buffer back to read-only
            vim.api.nvim_set_option_value("modifiable", false, { buf = bufnr })
          else
            vim.notify("jq is not installed. JSON response cannot be pretty-printed.", vim.log.levels.WARN)
          end
        end
      end,
    }
  end, -- 4. Keybindings
  -- These use the standard LazyVim leader key mapping.
  keys = {
    -- Send the request under the cursor
    { "<leader>rr", "<cmd>Rest run<cr>", desc = "🚀 Rest: Run Request" },

    -- Send the last executed request
    { "<leader>rl", "<cmd>Rest run last<cr>", desc = "🔄 Rest: Run Last Request" },

    -- Close the result window/tab
    { "<leader>rq", "<cmd>Rest close<cr>", desc = "❌ Rest: Close Result" },

    -- Toggle between showing the full response and a stripped-down view
    { "<leader>rt", "<cmd>Rest toggle headers<cr>", desc = "📋 Rest: Toggle Headers" },

    -- Opens a new vertical split with the current environment variables
    { "<leader>re", "<cmd>Rest open environment<cr>", desc = "🌍 Rest: Open Environment" },
  },
}
