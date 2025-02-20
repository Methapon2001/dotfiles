return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    ---@module "conform"
    ---@type conform.setupOpts
    opts = {
      formatters_by_ft = {
        ["lua"] = { "stylua" },
      },
    },
    -- stylua: ignore
    keys = {
      { "<leader>cf", function() require("conform").format({ async = true }) end, desc = "Format Buffer" }
    },
  },
  { import = "plugins.formatter" },
}
