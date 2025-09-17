---@module "lazy.types"
---@type LazySpec|LazySpec[]
return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    cmd = { "TSUpdate", "TSInstall", "TSLog", "TSUninstall" },
    build = ":TSUpdate",
    config = function()
      local treesitter = require("nvim-treesitter")

      local languages = {
        "bash",
        "c",
        "html",
        "css",
        "javascript",
        "jsdoc",
        "json",
        "lua",
        "luadoc",
        "luap",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "typescript",
        "vim",
        "vimdoc",
        "yaml",
        "vue",
        "svelte",
        "toml",
        "rust",
      }

      local not_installed = vim.tbl_filter(function(lang)
        return not vim.tbl_contains(treesitter.get_installed("parsers"), lang)
      end, languages)

      if #not_installed > 0 then
        treesitter.install(not_installed, { summary = true })
      end

      vim.api.nvim_create_autocmd("FileType", {
        callback = function(args)
          local lang = vim.treesitter.language.get_lang(args.match)
          if vim.tbl_contains(treesitter.get_installed("parsers"), lang) then
            vim.treesitter.start()
          end
        end,
      })
    end,
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@module "flash.nvim"
    ---@type Flash.Config
    opts = {},
    keys = {
      {
        "<c-space>",
        mode = { "n", "o", "x" },
        function()
          require("flash").treesitter({
            actions = {
              ["<c-space>"] = "next",
              ["<bs>"] = "prev",
            },
          })
        end,
        desc = "Treesitter Incremental Selection",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    event = "VeryLazy",
    opts = {},
  },
  {
    "windwp/nvim-ts-autotag",
    event = { "VeryLazy" },
    opts = {},
  },
}
