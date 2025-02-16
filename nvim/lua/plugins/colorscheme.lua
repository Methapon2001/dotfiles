return {
  "catppuccin/nvim",
  name = "catppuccin",
  opts = {
    flavour = "macchiato",
    integrations = {
      blink_cmp = true,
      fidget = true,
      gitsigns = true,
      indent_blankline = {
        enabled = true,
        scope_color = "lavender",
        colored_indent_levels = false,
      },
      mason = true,
      mini = {
        enabled = true,
        indentscope_color = "lavender",
      },
      native_lsp = {
        enabled = true,
        underlines = {
          errors = { "underline" },
          hints = { "underline" },
          warnings = { "underline" },
          information = { "underline" },
        },
      },
      treesitter = true,
      treesitter_context = true,
    },
  },
}
