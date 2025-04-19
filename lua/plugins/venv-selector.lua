return {
  "linux-cultist/venv-selector.nvim",
  dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap-python" },
  opts = {
    settings = {
      search = {
        anaconda_envs = {
          command = "fd bin/python$ ~/.conda/envs --full-path --color never -E /proc",
        },
        anaconda_base = {
          command = "fd 'bin/python$' ~/.conda/ --full-path --color never -E /proc -E /pkgs -E /envs",
        },
      },
    },
  },
  event = "VeryLazy", -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
  keys = {
    -- Keymap to open VenvSelector to pick a venv.
    { "<leader>vs", "<cmd>VenvSelect<cr>" },
    -- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
    { "<leader>vc", "<cmd>VenvSelectCached<cr>" },
  },
}
