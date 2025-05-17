---@module "lazy.types"
---@type LazySpec|LazySpec[]
return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
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
      snacks = true,
      treesitter = true,
      treesitter_context = true,
    },
  },
  config = function(_, opts)
    require("catppuccin").setup(opts)
    vim.cmd.colorscheme("catppuccin")
  end,
}
