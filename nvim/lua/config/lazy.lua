require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
  default = {
    version = false,
    lazy = false,
  },
  install = {
    colorscheme = { "catppuccin", "habamax" },
  },
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
})
