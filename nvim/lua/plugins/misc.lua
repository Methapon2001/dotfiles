---@module "lazy.types"
---@type LazySpec|LazySpec[]
return {
  { "nvim-lua/plenary.nvim", lazy = true },
  { "j-hui/fidget.nvim", opts = {} },
  { "mvllow/modes.nvim", opts = {} },
  { "numToStr/Comment.nvim", opts = {} },
  {
    "folke/snacks.nvim",
    lazy = false,
    ---@module "snacks"
    ---@type snacks.Config
    opts = {
      input = {
        win = {
          relative = "cursor",
          row = -3,
          col = 0,
          width = 32,
        },
      },
      lazygit = {
        configure = false,
      },
      statuscolumn = {
        folds = { open = true },
        left = { "mark", "sign", "git" },
        right = { "fold" },
      },
      picker = {
        layout = {
          preview = false, -- use <a-p> to toggle preview
          layout = {
            backdrop = false,
          },
        },
      },
    },
    -- stylua: ignore
    keys = {
      { "<leader><space>", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
      { "<leader>/", function() Snacks.picker.grep() end, desc = "Live Grep" },
      { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
      { "<leader>fb", function () Snacks.picker.buffers() end, desc = "Find Buffers" },
      { "<leader>fd", function () Snacks.picker.diagnostics() end, desc = "Diagnostics" },
      { "<leader>ft", function () Snacks.picker.treesitter() end, desc = "Treesitter Nodes" },
      { "<leader>fz", function () Snacks.picker.zoxide() end, desc = "Zoxide" },
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
  {
    "stevearc/overseer.nvim",
    event = "VeryLazy",
    -- stylua: ignore
    keys = {
      { "<leader>tr", function() require("overseer").run_task({}) end, desc = "Run a task" },
    },
    ---@module 'overseer'
    ---@type overseer.SetupOpts
    opts = {},
  },
}
