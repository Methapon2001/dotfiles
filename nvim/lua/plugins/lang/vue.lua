---@module "lazy.types"
---@type LazySpec[]
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        vue_ls = {
          init_options = {
            vue = {
              hybridMode = true,
            },
          },
        },
        vtsls = {},
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      if type(opts.servers.vtsls.filetypes) ~= "table" then
        opts.servers.vtsls.filetypes = {}
      end

      table.insert(opts.servers.vtsls.filetypes, "vue")
      require("utils").extend(opts.servers.vtsls, "settings.vtsls.tsserver.globalPlugins", {
        {
          name = "@vue/typescript-plugin",
          location = require("utils").get_pkg_path("vue-language-server", "/node_modules/@vue/language-server"),
          languages = { "vue" },
          configNamespace = "typescript",
          enableForWorkspaceTypeScriptVersions = true,
        },
      })
    end,
  },
}
