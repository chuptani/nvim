-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keym-- This file is automatically loaded by lazyvim.config.init
-- local Util = require("lazyvim.util")

-- DO NOT USE THIS IN YOU OWN CONFIG!!
-- use `vim.keymap.set` instead

local map = vim.keymap.set
local del = vim.keymap.del
-- local wk = require("which-key")

-- <leader>a, Append copy
map("v", "<leader>a", "", { desc = "copy append" })
map("v", "<Leader>ay", '"Ay', { noremap = true, silent = true, desc = "Append to register 'a'" })
map("n", "<leader>a", "", { desc = "copy append" })
map("n", "<Leader>ay", '"Ay', { noremap = true, silent = true, desc = "Append to register 'a'" })
map("n", "<Leader>ap", function()
  vim.fn.setreg("+", vim.fn.getreg("a"))
end, { noremap = true, silent = true, desc = "Copy register 'a' to clipboard" })
map("n", "<Leader>ac", function()
  vim.fn.setreg("a", "")
end, { noremap = true, silent = true, desc = "Clear the register 'a" })

-- <leaderv>, vimtex
del("n", "<localleader>l")
map("n", "<leader>v", "", { desc = "vimtex" })
map("n", "<leader>va", ":VimtexContextMenu<CR>", { desc = "Vimtex Context Menu", silent = true })
map("n", "<leader>vv", "<plug>(vimtex-view)", { desc = "Vimtex View", silent = true })
map("n", "<leader>ve", ":VimtexErrors<CR>", { desc = "Vimtex Errors", silent = true })
map("n", "<leader>vm", ":VimtexImapsList<CR>", { desc = "Vimtex Imaps List", silent = true })
map("n", "<leader>vo", ":VimtexCompileOutput<CR>", { desc = "Vimtex Compile Output", silent = true })
map("n", "<leader>vq", ":VimtexLog<CR>", { desc = "Vimtex Log", silent = true })
map("n", "<leader>vl", "<plug>(vimtex-compile)", { desc = "Vimtex Compile", silent = true })
map("n", "<leader>vL", ":VimtexCompileSelected<CR>", { desc = "Vimtex Compile Selected", silent = true })
map("n", "<leader>vi", ":VimtexInfo<CR>", { desc = "Vimtex Info", silent = true })
map("n", "<leader>vI", ":VimtexInfo!<CR>", { desc = "Vimtex Info Full", silent = true })
map("n", "<leader>vg", ":VimtexStatus<CR>", { desc = "Vimtex Status", silent = true })
map("n", "<leader>vG", ":VimtexStatus!<CR>", { desc = "Vimtex Status All", silent = true })
map("n", "<leader>vs", ":VimtexToggleMain<CR>", { desc = "Vimtex Toggle Main", silent = true })
map("n", "<leader>vx", ":VimtexReload<CR>", { desc = "Vimtex Reload", silent = true })
map("n", "<leader>vX", ":VimtexReloadState<CR>", { desc = "Vimtex Reload State", silent = true })
map("n", "<leader>vc", ":VimtexClean<CR>", { desc = "Vimtex Clean", silent = true })
map("n", "<leader>vC", ":VimtexCleanFull<CR>", { desc = "Vimtex Clean Full", silent = true })
map("n", "<leader>vt", ":VimtexTocOpen<CR>", { desc = "Vimtex TOC Open", silent = true })
map("n", "<leader>vT", ":VimtexTocToggle<CR>", { desc = "Vimtex TOC Toggle", silent = true })
map("n", "<leader>vk", ":VimtexStop<CR>", { desc = "Vimtex Stop", silent = true })
map("n", "<leader>vK", ":VimtexStopAll<CR>", { desc = "Vimtex Stop All", silent = true })
