return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    config = function()
      require("neo-tree").setup({
        window = {
          position = "float",
        },
        filesystem = {
          -- hijack_netrw_behavior = "open_current",
        },
      })
    end,
  },
}
