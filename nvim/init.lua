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
require("config.lazy")

local ok, _ = pcall(require, "catppuccin")

if ok then
  vim.cmd.colorscheme("catppuccin")
end

require("config.autocmds")
require("config.keymaps")
