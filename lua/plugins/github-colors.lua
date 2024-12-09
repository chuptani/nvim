return {
  { -- was missing this
    "wojciechkepka/vim-github-dark",

    config = function()
      require("catppuccin").setup({
        github_colors = {
          -- base0 = "#000000",
        },
      })
    end,
  },
}
