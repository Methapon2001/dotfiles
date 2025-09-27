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
          draw = {
            columns = { { "kind_icon", "label", "label_description", gap = 1 }, { "source_name" } },
            treesitter = { "lsp" },
          },
        },
        documentation = { auto_show = true },
      },
    },
  },
}
