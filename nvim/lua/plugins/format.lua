return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      javascript = { "prettierd" },
      typescript = { "prettierd" },
      javascriptreact = { "prettierd" },
      typescriptreact = { "prettierd" },
      html = { "prettierd" },
      css = { "prettierd" },
      jsonc = { "prettierd" },
      vue = { "prettierd" },
      rust = { "rustfmt" },
    },
    format_after_save = {
      lsp_fallback = true,
    },
  },
}
