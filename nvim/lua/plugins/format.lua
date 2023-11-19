return {
  "stevearc/conform.nvim",
  event = "VeryLazy",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      html = { "prettier" },
      css = { "prettier" },
      javascript = { "prettier" },
      typescript = { "prettier" },
      javascriptreact = { "prettier" },
      typescriptreact = { "prettier" },
      yaml = { "prettier" },
      json = { "prettier" },
      jsonc = { "prettier" },
      markdown = { "prettier" },
      graphql = { "prettier" },
      svelte = { "prettier" },
      vue = { "prettier" },
      rust = { "rustfmt" },
    },
    format_after_save = {
      lsp_fallback = true,
    },
  },
  -- stylua: ignore
  keys = {
    { "<leader>cf", function() require("conform").format({ async = true, lsp_fallback = true }) end, desc = "Format Buffer" }
  }
,
}
