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
          draw = {
            treesitter = { "lsp" },
          },
        },
        documentation = { auto_show = true },
      },
      sources = { cmdline = {} },
    },
  },
}
