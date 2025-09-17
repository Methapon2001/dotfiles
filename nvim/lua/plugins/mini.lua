---@module "lazy.types"
---@type LazySpec|LazySpec[]
return {
  { "nvim-mini/mini.statusline", event = "VeryLazy", opts = {} },
  { "nvim-mini/mini.tabline", event = "VeryLazy", opts = {} },
  { "nvim-mini/mini.pairs", event = { "BufReadPre", "BufNewFile" }, opts = {} },
  { "nvim-mini/mini.surround", event = { "BufReadPre", "BufNewFile" }, opts = {} },
  { "nvim-mini/mini.splitjoin", event = { "BufReadPre", "BufNewFile" }, opts = {} },
  { "nvim-mini/mini.move", event = { "BufReadPre", "BufNewFile" }, opts = {} },
  {
    "nvim-mini/mini.bufremove",
    event = { "BufReadPre", "BufNewFile" },
    -- stylua: ignore
    keys = {
      { "<leader>bd", function() require("mini.bufremove").delete(0, false) end, desc = "Delete Buffer" },
      { "<leader>bD", function() require("mini.bufremove").delete(0, true) end, desc = "Delete Buffer (Force)" },
    },
  },
  {
    "nvim-mini/mini.indentscope",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      symbol = "│",
      options = { try_as_border = true },
    },
  },
  {
    "nvim-mini/mini.cursorword",
    event = { "BufReadPre", "BufNewFile" },
    opts = { delay = 500 },
  },
  {
    "nvim-mini/mini.hipatterns",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "nvim-mini/mini.extra" },
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
    "nvim-mini/mini.ai",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "nvim-mini/mini.extra",
      "nvim-treesitter/nvim-treesitter-textobjects",
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
  { "nvim-mini/mini.icons", opts = {} },
}
