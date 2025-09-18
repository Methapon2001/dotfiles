---@module "lazy.types"
---@type LazySpec|LazySpec[]
return {
  "mikavilpas/yazi.nvim",
  event = "VeryLazy",
  init = function()
    --- More details: https://github.com/mikavilpas/yazi.nvim/issues/802
    vim.g.loaded_netrw = 1
  end,
  keys = {
    {
      "<leader>e",
      "<cmd>Yazi<cr>",
      desc = "Open yazi at the current file",
    },
    {
      "<leader>E",
      "<cmd>Yazi cwd<cr>",
      desc = "Open the file manager in nvim's working directory",
    },
  },
  opts = { open_for_directories = true },
}
