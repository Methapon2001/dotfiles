local M = {}

-- stylua: ignore
M.keymaps = {
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
            require("mini.extra").pickers.lsp({ scope = "declaration" }, { reuse_win = true })
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
            require("mini.extra").pickers.lsp({ scope = "definition" }, { reuse_win = true })
          else
            vim.lsp.buf.definition()
          end
        end,
      })
    end,
    desc = "Goto Definition",
  },
  { "K", vim.lsp.buf.hover, desc = "Hover" },
  { "]d", vim.diagnostic.goto_next, desc = "Next Diagnostic" },
  { "[d", vim.diagnostic.goto_prev, desc = "Prev Diagnostic" },
  { "gi", function() require("mini.extra").pickers.lsp({ scope = "implementation" }, { reuse_win = true }) end, desc = "Goto Implementation" },
  { "gr", function() require("mini.extra").pickers.lsp({ scope = "references" }, { reuse_win = true }) end, desc = "Goto References" },
  { "gs", function() require("mini.extra").pickers.lsp({ scope = "document_symbol" }, { reuse_win = true }) end, desc = "Symbols" },
}

---@param buffer buffer
function M.on_attach(_, buffer)
  for _, keymap in pairs(M.keymaps) do
    local opts = { buffer } ---@type vim.keymap.set.Opts

    for k, v in pairs(keymap) do
      if type(k) ~= "number" then
        opts[k] = v
      end
    end

    vim.keymap.set(keymap.mode or "n", keymap[1], keymap[2], opts)
  end
end

return M
