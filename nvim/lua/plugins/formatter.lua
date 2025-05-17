---@module "lazy.types"
---@type LazySpec|LazySpec[]
return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  ---@module "conform"
  ---@type conform.setupOpts
  opts = {
    formatters_by_ft = {
      ["lua"] = { "stylua" },
      ["html"] = { "prettier" },
      ["css"] = { "prettier" },
      ["javascript"] = { "prettier" },
      ["typescript"] = { "prettier" },
      ["javascriptreact"] = { "prettier" },
      ["typescriptreact"] = { "prettier" },
      ["yaml"] = { "prettier" },
      ["json"] = { "prettier" },
      ["jsonc"] = { "prettier" },
      ["markdown"] = { "prettier" },
      ["graphql"] = { "prettier" },
      ["vue"] = { "prettier" },
      ["svelte"] = { "prettier" },
    },
    format_after_save = {
      lsp_format = "fallback",
    },
  },
  -- stylua: ignore
  keys = {
    { "<leader>cf", function() require("conform").format({ async = true }) end, desc = "Format Buffer" }
  },
}
