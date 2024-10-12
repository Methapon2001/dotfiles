return {
  {
    "saghen/blink.cmp",
    version = "v0.2.1",
    dependencies = "rafamadriz/friendly-snippets",
    lazy = false,
    opts = {
      keymap = {
        accept = { "<Tab>", "<CR>" },
      },
      windows = {
        autocomplete = {
          draw = "reversed",
        },
        documentation = {
          auto_show = true,
        },
      },
      highlight = {
        -- fallback highlight groups to nvim-cmp's highlight groups
        -- useful for when your theme doesn't support blink.cmp
        -- will be removed in a future release
        use_nvim_cmp_as_default = true,
      },
    },
  },
}
