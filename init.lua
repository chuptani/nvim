-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

require("notify").setup({ background_colour = "#000000" })

require("venv-selector").setup({
  search_workspace = false,
  search = false,
})

-- local lazy_status = require("lazy.status")
-- require("lualine").setup({
--   sections = {
--     lualine_x = { {
--       lazy_status.updates,
--       cond = lazy_status.has_updates,
--     } },
--   },
-- })

-- require("lspconfig").pylsp.setup({
--   settings = {
--     pylsp = {
--       plugins = {
--         pylsp_mypy = {
--           enabled = true,
--         },
--         pycodestyle = {
--           maxLineLength = 100,
--         },
--       },
--     },
--   },
-- })

require("lspconfig").arduino_language_server.setup({

  cmd = {
    "arduino-language-server",
    "-cli-config",
    "/home/chuptani/.arduino15/arduino-cli.yaml",
    -- "-fqbn",
    -- "esp32:esp32:esp32doit-devkit-v1",
  },
})

require("gruvbox").setup({
  -- palette_overrides = {
  --   dark0 = "#000000",
  --   -- dark0 = "#0e1010",
  --   -- dark1 = "#1f1f1f",
  --   dark1 = "#151515",
  -- },
  transparent_mode = true,
})

-- require("tokyonight").setup({
--   transparent = true,
-- })

require("colorizer").setup()

vim.cmd("colorscheme catppuccin-mocha")

vim.cmd([[
  autocmd VimEnter * if argc() == 0 | Explore | endif
]])
