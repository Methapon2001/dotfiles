return {
  ---@type LazySpec
  {
    "mikavilpas/yazi.nvim",
    lazy = false,
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
  },
}
