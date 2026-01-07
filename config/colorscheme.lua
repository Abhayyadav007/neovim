local M = {}

local config_file = vim.fn.stdpath("config") .. "/lua/config/colorscheme_data.lua"

function M.load()
  local ok, saved = pcall(dofile, config_file)
  if ok and saved and saved.name then
    local success, _ = pcall(vim.cmd.colorscheme, saved.name)
    if not success then
      vim.notify("Failed to load colorscheme '" .. saved.name .. "', falling back to 'tokyonight'", vim.log.levels.WARN)
      vim.cmd.colorscheme("tokyonight-night")
    end
  else
    vim.cmd.colorscheme("tokyonight-night")
  end
end

function M.save(name)
  local file = io.open(config_file, "w")
  if file then
    file:write("return { name = '" .. name .. "' }")
    file:close()
  else
    vim.notify("Failed to save colorscheme!", vim.log.levels.ERROR)
  end
end

return M
