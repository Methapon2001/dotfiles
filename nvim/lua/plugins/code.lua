---@type LazySpec[]
return {
  {
    "saghen/blink.cmp",
    build = "cargo +nightly build --release",
    dependencies = "rafamadriz/friendly-snippets",
    lazy = false,
    opts = {
      keymap = { preset = "enter" },
      completion = {
        list = {
          selection = { auto_insert = false },
        },
        menu = {
          auto_show = function(ctx)
            return ctx.mode ~= "cmdline"
          end,
          draw = {
            treesitter = { "lsp" },
          },
        },
        documentation = { auto_show = true },
      },
    },
  },
  {
    "jeangiraldoo/codedocs.nvim",
    opts = {},
    -- stylua: ignore
    keys = {
      { "<leader>k", function() require("codedocs").insert_docs() end, desc = "Inserts a docstring into the buffer" }
    },
  },
}
