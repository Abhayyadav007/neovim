return {
  "saghen/blink.cmp",
  opts = function(_, opts)
    -- 1. Disable automatic popup (this stops { ( [ from showing suggestions)
    opts.trigger = opts.trigger or {}
    opts.trigger.show = opts.trigger.show or {}
    opts.trigger.show.auto = false -- MAIN FIX: no auto popup

    -- 2. MacBook-friendly keybindings
    opts.keymap = {
      preset = "default", -- keeps arrows, Enter, etc. working

      -- TRIGGER COMPLETION (choose ONE of these two)
      ["<M-Space>"] = { "show", "fallback" }, -- Option + Space (RECOMMENDED)
      -- ["<D-Space>"] = { "show", "fallback" },  -- Cmd + Space (only if you disabled Spotlight)

      -- Close menu
      ["<C-e>"] = { "hide" },
      ["<Esc>"] = { "hide" },

      -- Navigate suggestions (super smooth on Mac)
      ["<Tab>"] = { "select_next", "fallback" },
      ["<S-Tab>"] = { "select_prev", "fallback" },
      ["<Down>"] = { "select_next", "fallback" },
      ["<Up>"] = { "select_prev", "fallback" },

      -- Accept suggestion
      ["<CR>"] = { "accept", "fallback" }, -- Enter = accept
    }

    -- 3. Extra safety: never show right after typing {[(
    opts.enabled = function()
      local col = vim.api.nvim_win_get_cursor(0)[2]
      if col > 0 then
        local line = vim.api.nvim_get_current_line()
        local char = line:sub(col, col)
        if char == "{" or char == "(" or char == "[" then
          return false
        end
      end
      return true
    end

    return opts
  end,
}
