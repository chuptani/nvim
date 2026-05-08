return {
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "lewis6991/async.nvim", -- Retained to fix the previous async error
    },
    opts = {},
    config = function(_, opts)
      -- Initialize the plugin with the provided options
      require("refactoring").setup(opts)

      -- Overriding this config function prevents LazyVim's default setup
      -- from attempting to load the deprecated telescope extension.
    end,
  },
}
