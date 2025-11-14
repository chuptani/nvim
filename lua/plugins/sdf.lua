return {
  -- This is now a single, valid plugin spec
  {
    "neovim/nvim-lspconfig",

    -- 1. This init function will run on startup, *before*
    --    the plugin loads. This is perfect for our autocmd.
    init = function()
      vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
        pattern = "*.sdf",
        callback = function()
          vim.bo.filetype = "xml"
        end,
        desc = "Set filetype for .sdf to xml",
      })
    end,

    -- 2. These opts will be merged when lspconfig loads,
    --    configuring the lemminx server.
    opts = {
      servers = {
        lemminx = {
          settings = {
            xml = {
              schemas = {
                {
                  uri = "http://sdformat.org/schemas/root.xsd",
                  fileMatch = { "*.sdf" },
                },
              },
            },
          },
        },
      },
    },
  },
}
