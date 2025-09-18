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
            ---@module "snacks"
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
            ---@module "snacks"
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

---@param buffer number
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

---@module "lazy.types"
---@type LazySpec|LazySpec[]
return {
  {
    "mason-org/mason.nvim",
    cmd = "Mason",
    build = ":MasonUpdate",
    opts = {},
    keys = {
      { "<leader>m", "<cmd>Mason<cr>", desc = "Mason" },
    },
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile", "BufWritePre" },
    dependencies = { "mason-org/mason.nvim" },
    opts = {
      ---@type vim.diagnostic.Opts
      diagnostics = {
        underline = true,
        update_in_insert = false,
        severity_sort = true,
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
      ---@type table<string, vim.lsp.Config>
      servers = {
        typos_lsp = {},
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

      local mason_packages = {
        "typos-lsp",

        -- Lua
        "lua-language-server",
        "stylua",

        -- Python
        "basedpyright",
        "ruff",

        -- Rust (rust-analyzer is installed by rustup)
        "taplo",

        -- C, C++, Rust, Zig Debugger
        "codelldb",

        -- Json
        "json-lsp",

        -- JavaScript/TypeScript
        "vtsls",
        "svelte-language-server",
        "vue-language-server",

        --- Formatter for various languages.
        "prettier",
      }

      for _, package_name in ipairs(mason_packages) do
        local ok, pkg = pcall(require("mason-registry").get_package, package_name)
        if ok and not pkg:is_installed() and not pkg:is_installing() then
          pkg:install(
            { version = pkg:get_latest_version() },
            vim.schedule_wrap(function(success)
              if success then
                vim.notify(("[mason] %s was successfully installed"):format(package_name))
              else
                vim.notify(("[mason] failed to install %s."):format(package_name), vim.log.levels.ERROR)
              end
            end)
          )
        end
      end

      for server, server_opts in pairs(opts.servers) do
        if server_opts then
          server_opts = server_opts == true and {} or server_opts
          vim.lsp.config(server, server_opts)
          vim.lsp.enable(server)
        end
      end
    end,
  },
  {
    "folke/lazydev.nvim",
    ft = "lua",
    cmd = "LazyDev",
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
  { import = "plugins.lang" },
}
