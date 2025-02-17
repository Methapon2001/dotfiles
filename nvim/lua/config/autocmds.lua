local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

autocmd("TextYankPost", {
  group = augroup("highlight_yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

autocmd({ "BufRead" }, {
  group = augroup("RestoreCursor", {}),
  pattern = "*",
  callback = function()
    if vim.buftype == "terminal" then
      return
    end
    local ft = vim.bo.filetype
    if
      not (ft:match("commit") or ft:match("rebase"))
      and vim.fn.line("'\"") > 1
      and vim.fn.line("'\"") <= vim.fn.line("$")
    then
      vim.cmd('normal! g`"')
    end
  end,
})
