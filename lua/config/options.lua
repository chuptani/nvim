-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.winbar = "%=%m %f"
vim.g.snacks_animate = false

-- vim.g.loaded_netrwPlugin = 1
vim.g.netrw_liststyle = 3 -- Use Zathura as the PDF viewer
vim.g.vimtex_view_method = "zathura"

-- Set the sync mode to 'focus' to sync with the existing viewer window
vim.g.vimtex_view_forward_method = "focus"

-- Prevent opening a new window when compiling
vim.g.vimtex_view_use_temp_files = 1

vim.g.vimtex_mappings_enabled = 0
-- vim.g.copilot_assume_mapped = true
-- vim.g.copilot_no_tab_map = true
-- vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

-- vim.opt.suffixesadd:append(".md")
