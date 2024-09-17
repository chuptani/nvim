-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

require("notify").setup({
  background_colour = "#000000",
})

require("venv-selector").setup({
  settings = {
    search = {
      anaconda_envs = {
        command = "fd bin/python$ ~/.anaconda3/envs --full-path --color never -E /proc",
      },
      anaconda_base = {
        command = "fd 'bin/python$' ~/.anaconda3/ --full-path --color never -E /proc -E /pkgs -E /envs",
      },
    },
  },
})

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

-- require("gruvbox").setup({
--   -- palette_overrides = {
--   --   dark0 = "#000000",
--   --   -- dark0 = "#0e1010",
--   --   -- dark1 = "#1f1f1f",
--   --   dark1 = "#151515",
--   -- },
--   transparent_mode = true,
-- })

require("tokyonight").setup({
  transparent = true,
})

require("colorizer").setup()

require("neo-tree").setup({
  window = {
    position = "float",
  },
  filesystem = {
    -- hijack_netrw_behavior = "open_current",
  },
})

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.argc() == 0 then
      vim.cmd("Neotree")
    end
  end,
})

require("catppuccin").setup({
  color_overrides = {
    -- all = {
    --   text = "#ffffff",
    -- },
    mocha = {
      base = "#000000",
      mantle = "#000000",
      crust = "#000000",
    },
  },
  transparent_background = true,
})

vim.cmd("colorscheme catppuccin-mocha")
