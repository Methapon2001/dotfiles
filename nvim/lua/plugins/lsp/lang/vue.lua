return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        volar = {
          init_options = {
            vue = {
              hybridMode = false,
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
      if type(opts.servers.vtsls.plugins) ~= "table" then
        opts.servers.vtsls.plugins = {}
      end

      vim.list_extend(opts.servers.vtsls.plugins, {
        name = "@vue/typescript-plugin",
        location = require("utils").get_pkg_path("vue-language-server", "/node_modules/@vue/language-server"),
        languages = { "vue" },
        configNamespace = "typescript",
        enableForWorkspaceTypeScriptVersions = true,
      })
    end,
  },
}
