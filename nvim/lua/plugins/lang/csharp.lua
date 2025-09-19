---@module "lazy.types"
---@type LazySpec[]
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        csharp_ls = {},
      },
    },
  },
  {
    "decodetalkers/csharpls-extended-lsp.nvim",
    ft = "cs",
    config = function()
      require("csharpls_extended").buf_read_cmd_bind()
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        ["cs"] = { "csharpier" },
      },
    },
  },
}
