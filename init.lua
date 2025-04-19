-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

require("lspconfig").arduino_language_server.setup({
  cmd = {
    "arduino-language-server",
    "-cli-config",
    "/home/chuptani/.arduino15/arduino-cli.yaml",
    -- "-fqbn",
    -- "esp32:esp32:esp32doit-devkit-v1",
  },
})

vim.cmd("colorscheme rose-pine")
