return {
  "mfussenegger/nvim-lint",
  optional = true,
  opts = {
    linters = {
      ["markdownlint-cli2"] = {
        args = { "--config", "/home/chuptani/.markdownlint-cli2.yaml", "--" },
      },
    },
  },
}
