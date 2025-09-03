---@module "lazy.types"
---@type LazySpec|LazySpec[]
return {
  "rose-pine/neovim",
  name = "rose-pine",
  priority = 1000,
  opts = {
    variant = "moon",
  },
  config = function(_, opts)
    require("rose-pine").setup(opts)
    vim.cmd.colorscheme("rose-pine")
  end,
}
