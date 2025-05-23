return {
  "mfussenegger/nvim-lint",
  optional = true,
  opts = function(_, opts)
    opts.linters = opts.linters or {}
    opts.linters["markdownlint-cli2"] = {
      args = { "--config", "/home/chuptani/.markdownlint-cli2.yaml", "--" },
    }
    return opts
  end,
}
