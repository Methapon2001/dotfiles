---@module "lazy.types"
---@type LazySpec[]
return {
  { "b0o/SchemaStore.nvim", lazy = true },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        jsonls = {
          before_init = function(_, conf)
            require("utils").extend(conf, "settings.json.schemas", require("schemastore").json.schemas())
          end,
          settings = {
            json = {
              validate = { enable = true },
            },
          },
        },
      },
    },
  },
}
