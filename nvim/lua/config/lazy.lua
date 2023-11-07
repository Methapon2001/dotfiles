require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
  default = {
    version = false,
    lazy = false,
  },
  install = {
    colorscheme = { "tokyonight", "habamax" },
  },
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
  ui = {
    border = "single",
  },
})
