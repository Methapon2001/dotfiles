---@module "lazy.types"
---@type LazySpec|LazySpec[]
return {
  {
    "saghen/blink.cmp",
    build = "cargo +nightly build --release",
    dependencies = "rafamadriz/friendly-snippets",
    lazy = false,
    ---@module "blink.cmp"
    ---@type blink.cmp.Config
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
            columns = { { "kind_icon", "label", "label_description", gap = 1 }, { "source_name" } },
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
