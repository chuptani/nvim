return {
  {
    "rose-pine/neovim",
    lazy = true,
    priority = 1000,
    config = function()
      require("rose-pine").setup({
        styles = {
          transparency = true,
        },
      })
    end,
  },
}
