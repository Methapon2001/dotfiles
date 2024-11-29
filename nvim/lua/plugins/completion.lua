return {
  {
    "saghen/blink.cmp",
    build = "cargo +nightly build --release",
    dependencies = "rafamadriz/friendly-snippets",
    lazy = false,
    opts = {
      keymap = {
        preset = "enter",
      },
      completion = {
        menu = {
          draw = {
            columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind", gap = 1 } },
          },
        },
        documentation = {
          auto_show = true,
        },
      },
    },
  },
}
