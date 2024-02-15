-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keym-- This file is automatically loaded by lazyvim.config.init
-- local Util = require("lazyvim.util")

-- DO NOT USE THIS IN YOU OWN CONFIG!!
-- use `vim.keymap.set` instead
local map = vim.keymap.set

map("n", "<leader>E", "<cmd>Explore<CR>", { desc = "Toggle Explore (cwd)" })

map("n", "<leader>e", "<cmd>Explore .<CR>", { desc = "Toggle Explore (root)" })

-- function ToggleExplore()
--   if vim.fn.exists("g:expl_flag") and vim.g.expl_flag == 1 then
--     vim.cmd("Rexplore")
--   else
--     vim.cmd("Explore")
--   end
