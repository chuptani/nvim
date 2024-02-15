-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

require("notify").setup({
  background_colour = "#000000",
})

require("gruvbox").setup({
  palette_overrides = {
    -- dark0 = "#000000",
    dark0 = "#0e1010",
    dark1 = "#1f1f1f",
    -- dark1 = "#151515",
  },
})
vim.cmd("colorscheme gruvbox")

require("venv-selector").setup({
  search_workspace = false,
  search = false,
})

vim.cmd([[
  autocmd VimEnter * if argc() == 0 | Explore | endif
]])

-- vim.cmd("colorscheme xcolorscheme")

-- vim.cmd([[
--   autocmd VimEnter * if argc() == 0 | Explore | elseif isdirectory(argv()[0]) | Explore | endif
-- ]])

-- autocmd VimEnter * if argc() == 0 | NERDTree | endif
