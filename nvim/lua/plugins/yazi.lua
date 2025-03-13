---@type LazySpec
return {
  "mikavilpas/yazi.nvim",
  event = "VeryLazy",
  init = function()
    if vim.fn.argc() == 1 then
      local argv = vim.fn.argv(0)
      ---@diagnostic disable-next-line: param-type-mismatch
      local stat = vim.loop.fs_stat(argv)
      if stat and stat.type == "directory" then
        vim.fn.chdir(argv)
      end
    end
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
