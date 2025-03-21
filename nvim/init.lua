local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("config.options")
require("config.autocmds")
require("config.keymaps")

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

local ok, _ = pcall(require, "catppuccin")
if ok then
  vim.cmd.colorscheme("catppuccin")
end
