return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        vtsls = {
          filetypes = {
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
          },
          settings = {
            complete_function_calls = true,
            vtsls = {
              enableMoveToFileCodeAction = true,
              autoUseWorkspaceTsdk = true,
              experimental = {
                completion = {
                  enableServerSideFuzzyMatch = true,
                },
              },
            },
            typescript = {
              updateImportsOnFileMove = { enabled = "always" },
              suggest = {
                completeFunctionCalls = true,
              },
              inlayHints = {
                enumMemberValues = { enabled = true },
                functionLikeReturnTypes = { enabled = true },
                parameterNames = { enabled = "literals" },
                parameterTypes = { enabled = true },
                propertyDeclarationTypes = { enabled = true },
                variableTypes = { enabled = false },
              },
            },
          },
          plugins = {
            {
              name = "@vue/typescript-plugin",
              location = vim.env.MASON
                or (vim.fn.stdpath("data") .. "/mason")
                  .. "/packages/vue-language-server/node_modules/@vue/language-server",
              languages = { "vue" },
              configNamespace = "typescript",
              enableForWorkspaceTypeScriptVersions = true,
            },
          },
        },
        -- tsserver = {
        --   filetypes = {
        --     "javascript",
        --     "javascriptreact",
        --     "typescript",
        --     "typescriptreact",
        --   },
        --   init_options = {
        --     plugins = {
        --       {
        --         name = "@vue/typescript-plugin",
        --         location = vim.env.MASON
        --           or (vim.fn.stdpath("data") .. "/mason")
        --             .. "/packages/vue-language-server/node_modules/@vue/language-server",
        --         languages = { "vue" },
        --         configNamespace = "typescript",
        --         enableForWorkspaceTypeScriptVersions = true,
        --       },
        --     },
        --   },
        --   settings = {
        --     typescript = {
        --       inlayHints = {
        --         includeInlayEnumMemberValueHints = true,
        --         includeInlayFunctionLikeReturnTypeHints = true,
        --         includeInlayFunctionParameterTypeHints = true,
        --         includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
        --         includeInlayParameterNameHintsWhenArgumentMatchesName = true,
        --         includeInlayPropertyDeclarationTypeHints = true,
        --         includeInlayVariableTypeHints = false,
        --       },
        --       format = {
        --         indentSize = vim.o.shiftwidth,
        --         convertTabsToSpaces = vim.o.expandtab,
        --         tabSize = vim.o.tabstop,
        --       },
        --     },
        --     javascript = {
        --       inlayHints = {
        --         includeInlayEnumMemberValueHints = true,
        --         includeInlayFunctionLikeReturnTypeHints = true,
        --         includeInlayFunctionParameterTypeHints = true,
        --         includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
        --         includeInlayParameterNameHintsWhenArgumentMatchesName = true,
        --         includeInlayPropertyDeclarationTypeHints = true,
        --         includeInlayVariableTypeHints = false,
        --       },
        --       format = {
        --         indentSize = vim.o.shiftwidth,
        --         convertTabsToSpaces = vim.o.expandtab,
        --         tabSize = vim.o.tabstop,
        --       },
        --     },
        --     completions = {
        --       completeFunctionCalls = true,
        --     },
        --   },
        -- },
      },
    },
  },
}
