return {
  -- This plugin is for LINTING (error checking)
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters = {
        xmllint = {
          cmd = "xmllint",
          args = { "--noout", "-" },
          stdin = true,

          -- THIS IS THE FIX:
          -- The module is 'lint.parser' (no 's')
          -- The function is 'from_errorformat'
          parser = require("lint.parser").from_errorformat("-%*[^:]:%l:%c:%*[^:]:%m"),
        },
      },
      linters_by_ft = {
        xml = { "xmllint" },
      },
    },
  },

  -- This plugin is for FORMATTING (your conform config is perfect)
  {
    "stevearc/conform.nvim",
    opts = {
      formatters = {
        xmllint = {
          command = "xmllint",
          args = { "--format", "--recover", "-" },
          stdin = true,
        },
      },
      formatters_by_ft = {
        xml = { "xmllint" },
      },
    },
  },
}
