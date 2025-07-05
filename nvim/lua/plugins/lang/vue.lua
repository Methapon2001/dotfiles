---@module "lazy.types"
---@type LazySpec[]
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        vue_ls = {
          on_init = function(client)
            client.handlers["tsserver/request"] = function(_, result, context)
              local clients = vim.lsp.get_clients({ bufnr = context.bufnr, name = "vtsls" })
              if #clients == 0 then
                vim.notify(
                  "Could not found `vtsls` lsp client, vue_lsp would not work without it.",
                  vim.log.levels.ERROR
                )
                return
              end
              local ts_client = clients[1]

              local param = unpack(result)
              local id, command, payload = unpack(param)
              ts_client:exec_cmd({
                title = "vue_request_forward",
                command = "typescript.tsserverRequest",
                arguments = {
                  command,
                  payload,
                },
              }, { bufnr = context.bufnr }, function(_, r)
                local response_data = { { id, r.body } }
                ---@diagnostic disable-next-line: param-type-mismatch
                client:notify("tsserver/response", response_data)
              end)
            end
          end,
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
