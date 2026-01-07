return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons", -- For icons
  },
  opts = {
    close_if_last_window = false,
    popup_border_style = "NC", -- Clean borders
    enable_git_status = true,
    enable_diagnostics = true,
    default_component_configs = {
      icon = {
        folder_closed = "󰉋",
        folder_open = "󰝰",
        folder_empty = "󰉋",
      },
      git_status = {
        symbols = {
          added = "󰐙",
          modified = "",
          deleted = "󰧀",
        },
      },
    },
    window = {
      position = "right",
      width = 35,
      mapping_options = {
        noremap = true,
        nowait = true,
      },
      mappings = {
        ["<space>"] = "toggle_node",
        ["<cr>"] = "open",
        ["l"] = "open",
        ["h"] = "close_node",
        ["a"] = "add",
        ["d"] = "delete",
        ["r"] = "rename",
        ["?"] = "show_help",
      },
    },
    filesystem = {
      filtered_items = {
        hide_dotfiles = false, -- Show dotfiles if you want
        hide_gitignored = false,
      },
      follow_current_file = { enabled = true }, -- Auto-focus current file
      use_libuv_file_watcher = true,
    },
    -- Transparency: Set backgrounds to NONE (works with Catppuccin)
    highlight_overrides = {
      all = {
        NeoTreeNormal = { bg = "NONE" },
        NeoTreeNormalNC = { bg = "NONE" },
        NeoTreeWinSeparator = { fg = "fg", bg = "NONE" },
      },
    },
  },
}
