M = {}

-- stylua: ignore
M.keys = {
  { "<leader>cl", "<cmd>LspInfo<cr>", desc = "Lsp Info" },
  { "<leader>cr", vim.lsp.buf.rename, desc = "Rename" },
  { "<leader>ca", vim.lsp.buf.code_action, desc = "Code Action" },
  { "<leader>cd", vim.diagnostic.open_float, desc = "Line Diagnostics" },
  { "gD", vim.lsp.buf.declaration, desc = "Goto Declaration" },
  { "gd", function() require("telescope.builtin").lsp_definitions({ reuse_win = true }) end, desc = "Goto Definition" },
  { "gr", function() require("telescope.builtin").lsp_references() end, desc = "Goto References" },
  { "gi", function() require("telescope.builtin").lsp_implementations({ reuse_win = true }) end, desc = "Goto Implementation" },
  { "K", vim.lsp.buf.hover, desc = "Hover" },
  { "]d", vim.diagnostic.goto_next, desc = "Next Diagnostic" },
  { "[d", vim.diagnostic.goto_prev, desc = "Prev Diagnostic" },
}

function M.on_attach(_, buffer)
  local keys = require("lazy.core.handler.keys")

  for _, keymap in ipairs(M.keys) do
    local parsed = keys.parse(keymap)
    if parsed[2] ~= false then
      local opts = keys.opts(keymap)

      opts.silent = opts.silent ~= false
      opts.buffer = buffer
      vim.keymap.set(keymap.mode or "n", keymap[1], keymap[2], opts)
    end
  end
end

return M
