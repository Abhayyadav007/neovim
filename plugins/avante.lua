return {
  {
    "yetone/avante.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    build = "make", -- Important!
    opts = {
      -- Use the 'openrouter' provider defined below
      provider = "openrouter",
      providers = {
        openrouter = {
          -- **REQUIRED FIX**: Inherit from 'openai' since OpenRouter is compatible
          __inherited_from = "openai",

          -- OpenRouter API details
          endpoint = "https://openrouter.ai/api/v1",
          model = "nvidia/nemotron-nano-9b-v2",
          api_key_name = "OPENROUTER_API_KEY",

          -- Optional parameters
          extra_request_body = {
            temperature = 0.7,
          },
          max_tokens = 4096,
        },
      },
      -- Optional: Configure the input prompt for a better UI
      input = {
        provider = "dressing",
        provider_opts = {},
      },
    },
    -- NOTE: Custom keymaps block has been removed to use defaults.
  },
}
