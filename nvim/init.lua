local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
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

if vim.fn.argc() == 1 then
  local argv = vim.fn.argv(0)

  if type(argv) ~= "string" then
    return
  end

  local stat = vim.uv.fs_stat(argv)
  if stat and stat.type == "directory" then
    vim.fn.chdir(argv)
  end
end

require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
  default = {
    version = false,
    lazy = false,
  },
  install = {
    colorscheme = { "rose-pine", "habamax" },
  },
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
})
