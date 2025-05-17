return {
  { import = "plugins.lang.typescript" },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        svelte = {},
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      require("utils").extend(opts.servers.vtsls, "settings.vtsls.tsserver.globalPlugins", {
        {
          name = "typescript-svelte-plugin",
          location = require("utils").get_pkg_path("svelte-language-server", "/node_modules/typescript-svelte-plugin"),
          enableForWorkspaceTypeScriptVersions = true,
        },
      })
    end,
  },
}
