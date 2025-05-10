-- stylua: ignore
local keymaps = {
  { "<leader>cl", "<cmd>LspInfo<cr>", desc = "Lsp Info" },
  { "<leader>cr", vim.lsp.buf.rename, desc = "Rename" },
  { "<leader>ca", vim.lsp.buf.code_action, desc = "Code Action" },
  { "<leader>cd", vim.diagnostic.open_float, desc = "Line Diagnostics" },
  {
    "gD",
    function()
      vim.lsp.buf.declaration({
        on_list = function(opts)
          if #opts.items > 1 then
            Snacks.picker.lsp_declarations()
          else
            vim.lsp.buf.declaration()
          end
        end,
      })
    end,
    desc = "Goto Declaration",
  },
  {
    "gd",
    function()
      vim.lsp.buf.definition({
        on_list = function(opts)
          if #opts.items > 1 then
            Snacks.picker.lsp_definitions()
          else
            vim.lsp.buf.definition()
          end
        end,
      })
    end,
    desc = "Goto Definition",
  },
  { "K", vim.lsp.buf.hover, desc = "Hover" },
  { "]d", function () vim.diagnostic.jump({ count = 1, float = true }) end, desc = "Next Diagnostic" },
  { "[d", function () vim.diagnostic.jump({ count = -1, float = true }) end, desc = "Prev Diagnostic" },
  { "gi", function () Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
  { "gr", function () Snacks.picker.lsp_references() end, desc = "Goto References" },
  { "gs", function () Snacks.picker.lsp_symbols() end, desc = "Symbols" },
}

---@param buffer buffer
local function on_attach(_, buffer)
  for _, keymap in pairs(keymaps) do
    local opts = { buffer } ---@type vim.keymap.set.Opts

    for k, v in pairs(keymap) do
      if type(k) ~= "number" then
        opts[k] = v
      end
    end

    vim.keymap.set(keymap.mode or "n", keymap[1], keymap[2], opts)
  end
end

---@type LazySpec[]
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
      { "folke/neodev.nvim", opts = {} },
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    opts = {
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = {
          spacing = 4,
          source = "if_many",
        },
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.HINT] = " ",
            [vim.diagnostic.severity.INFO] = " ",
          },
        },
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
      vim.diagnostic.config(vim.deepcopy(opts.diagnostics))

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          local buffer = args.data.buffer ---@type number
          on_attach(client, buffer)
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
      local mason_lsp_servers = vim.tbl_keys(require("mason-lspconfig").get_mappings().lspconfig_to_package)

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
  { import = "plugins.lang" },
}
