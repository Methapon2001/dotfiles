return {
  { "b0o/SchemaStore.nvim", lazy = true },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        jsonls = {
          on_new_config = function(conf)
            conf.settings.json.schemas = conf.settings.json.schemas or {}
            vim.list_extend(conf.settings.json.schemas, require("schemastore").json.schemas())
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
