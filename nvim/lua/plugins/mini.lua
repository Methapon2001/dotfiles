---@type LazySpec[]
return {
  { "echasnovski/mini.statusline", event = "VeryLazy", opts = {} },
  { "echasnovski/mini.tabline", event = "VeryLazy", opts = {} },
  { "echasnovski/mini.pairs", event = { "BufReadPre", "BufNewFile" }, opts = {} },
  { "echasnovski/mini.surround", event = { "BufReadPre", "BufNewFile" }, opts = {} },
  { "echasnovski/mini.splitjoin", event = { "BufReadPre", "BufNewFile" }, opts = {} },
  { "echasnovski/mini.move", event = { "BufReadPre", "BufNewFile" }, opts = {} },
  {
    "echasnovski/mini.bufremove",
    event = { "BufReadPre", "BufNewFile" },
    -- stylua: ignore
    keys = {
      { "<leader>bd", function() require("mini.bufremove").delete(0, false) end, desc = "Delete Buffer" },
      { "<leader>bD", function() require("mini.bufremove").delete(0, true) end, desc = "Delete Buffer (Force)" },
    },
  },
  {
    "echasnovski/mini.indentscope",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      symbol = "│",
      options = { try_as_border = true },
    },
  },
  {
    "echasnovski/mini.cursorword",
    event = { "BufReadPre", "BufNewFile" },
    opts = { delay = 500 },
  },
  {
    "echasnovski/mini.hipatterns",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "echasnovski/mini.extra" },
    opts = function()
      local words = require("mini.extra").gen_highlighter.words
      return {
        highlighters = {
          fixme = words({ "FIXME" }, "MiniHipatternsFixme"),
          hack = words({ "HACK" }, "MiniHipatternsHack"),
          todo = words({ "TODO" }, "MiniHipatternsTodo"),
          note = words({ "NOTE" }, "MiniHipatternsNote"),
        },
      }
    end,
  },
  {
    "echasnovski/mini.ai",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "echasnovski/mini.extra",
      "nvim-treesitter-textobjects",
    },
    opts = function()
      local ai = require("mini.ai")
      local gen_ai_spec = require("mini.extra").gen_ai_spec
      return {
        n_lines = 300,
        custom_textobjects = {
          o = ai.gen_spec.treesitter({
            a = { "@block.outer", "@conditional.outer", "@loop.outer" },
            i = { "@block.inner", "@conditional.inner", "@loop.inner" },
          }, {}),
          f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }, {}),
          c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }, {}),
          B = gen_ai_spec.buffer(),
          D = gen_ai_spec.diagnostic(),
          I = gen_ai_spec.indent(),
          L = gen_ai_spec.line(),
          N = gen_ai_spec.number(),
        },
      }
    end,
  },
  { "echasnovski/mini.icons", opts = {} },
}
