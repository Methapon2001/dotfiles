return {
  { "nvim-lua/plenary.nvim", lazy = true },
  { "j-hui/fidget.nvim", opts = {} },
  { "numToStr/Comment.nvim", opts = {} },
  {
    "folke/snacks.nvim",
    lazy = false,
    opts = {
      input = {},
      lazygit = {
        configure = false,
      },
      statuscolumn = {
        folds = { open = true },
        left = { "mark", "sign", "git" },
        right = { "fold" },
      },
    },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      indent = { char = "│" },
      scope = { enabled = false },
      exclude = {
        filetypes = {
          "lazy",
          "mason",
        },
      },
    },
    main = "ibl",
  },
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
      },
      signs_staged = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
      },
      current_line_blame = true,
      on_attach = function(buffer)
        local gitsigns = package.loaded.gitsigns

        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
        end

        map("n", "]c", gitsigns.next_hunk, "Next Hunk")
        map("n", "[c", gitsigns.prev_hunk, "Prev Hunk")
        map({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
        map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
        map("n", "<leader>ghS", gitsigns.stage_buffer, "Stage Buffer")
        map("n", "<leader>ghu", gitsigns.undo_stage_hunk, "Undo Stage Hunk")
        map("n", "<leader>ghR", gitsigns.reset_buffer, "Reset Buffer")
        map("n", "<leader>ghp", gitsigns.preview_hunk, "Preview Hunk")
        map("n", "<leader>ghd", gitsigns.diffthis, "Diff This")
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
      end,
    },
  },
  {
    "MagicDuck/grug-far.nvim",
    opts = { headerMaxWidth = 80 },
    cmd = "GrugFar",
    keys = {
      {
        "<leader>sr",
        function()
          local grug = require("grug-far")
          local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
          grug.open({
            transient = true,
            prefills = {
              filesFilter = ext and ext ~= "" and "*." .. ext or nil,
            },
          })
        end,
        mode = { "n", "v" },
        desc = "Search and Replace",
      },
    },
  },
}
