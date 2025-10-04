---@module "lazy.types"
---@type LazySpec[]
return {
  {
    "mrcjkb/rustaceanvim",
    lazy = false, -- This plugin is already lazy
    init = function()
      ---@module "rustaceanvim"
      ---@type rustaceanvim.Opts
      vim.g.rustaceanvim = {
        server = {
          default_settings = {
            ["rust-analyzer"] = {
              cargo = {
                allFeatures = true,
                loadOutDirsFromCheck = true,
                buildScripts = {
                  enable = true,
                },
              },
              checkOnSave = true,
              procMacro = {
                enable = true,
                ignored = {
                  ["async-trait"] = { "async_trait" },
                  ["napi-derive"] = { "napi" },
                  ["async-recursion"] = { "async_recursion" },
                },
              },
              rustc = { source = "discover" },
            },
          },
        },
      }
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        taplo = {},
      },
    },
  },
  {
    "Saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    opts = {
      lsp = {
        enabled = true,
        actions = true,
        completion = true,
        hover = true,
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        ["rust"] = { "rustfmt" },
      },
    },
  },
}
