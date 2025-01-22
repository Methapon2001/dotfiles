return {
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    build = ":MasonUpdate",
    opts = {},
    keys = {
      { "<leader>m", "<cmd>Mason<cr>", desc = "Mason" },
    },
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      {
        { "folke/neodev.nvim", opts = {} },
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
      },
    },
    opts = {
      diagnostics = {
        underline = true,
        update_in_insert = true,
        virtual_text = {
          spacing = 4,
          source = "if_many",
        },
        severity_sort = true,
      },
      servers = {
        lua_ls = {
          settings = {
            Lua = {
              hint = {
                enable = true,
              },
              workspace = {
                checkThirdParty = false,
              },
              completion = {
                callSnippet = "Replace",
              },
            },
          },
        },
      },
      setup = {},
    },
    config = function(_, opts)
      for name, sign in pairs({
        Error = " ",
        Warn = " ",
        Hint = " ",
        Info = " ",
      }) do
        vim.fn.sign_define("DiagnosticSign" .. name, { text = sign, texthl = name, numhl = "" })
      end
      vim.diagnostic.config(vim.deepcopy(opts.diagnostics))

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          local buffer = args.data.buffer ---@type number
          require("plugins.lsp.keymaps").on_attach(client, buffer)
        end,
      })

      local capabilities = require("blink.cmp").get_lsp_capabilities(opts.capabilities)

      local servers = opts.servers

      local function setup(server)
        local server_opts = vim.tbl_deep_extend("force", {
          capabilities = vim.deepcopy(capabilities),
        }, servers[server] or {})

        if opts.setup[server] then
          if opts.setup[server](server, server_opts) then
            return
          end
        end

        require("lspconfig")[server].setup(server_opts)
      end

      local mason_lsp = require("mason-lspconfig")
      local mason_lsp_servers = vim.tbl_keys(require("mason-lspconfig.mappings.server").lspconfig_to_package)

      local ensure_installed = {} ---@type string[]
      for server, server_opts in pairs(servers) do
        if server_opts then
          server_opts = server_opts == true and {} or server_opts
          if not vim.tbl_contains(mason_lsp_servers, server) then
            setup(server)
          else
            ensure_installed[#ensure_installed + 1] = server
          end
        end
      end

      mason_lsp.setup({
        handlers = { setup },
        automatic_installation = true,
        ensure_installed = ensure_installed,
      })
    end,
  },
  { import = "plugins.lsp.lang" },
}
