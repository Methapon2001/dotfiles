return {
  {
    "echasnovski/mini.starter",
    event = "VimEnter",
    opts = function()
      local logo = [[
      ⠀⠀⠀⠀⠀⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⢿⢿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡟⢱⠉⠳⢄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡤⠆⠀⠀
      ⠀⠀⠀⠀⠀⣼⣿⡢⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡴⠚⠁⡜⢸⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠣⡬⡆⠀⠀⠱⢄⢀⣀⠀⠀⠀⠀⠀⠀⠀⢀⡠⠔⢊⠕⠁⠹⠁⠀
      ⠀⠀⠀⠀⠀⡝⠀⠙⣄⠉⠓⠦⣀⠀⠀⠀⢀⡤⠴⠤⣴⡿⣅⡀⢠⠗⠧⣇⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣏⡉⠁⢸⡴⠂⠉⠚⠉⠀⠉⠳⢤⣄⣀⡴⠊⠁⢀⡔⣁⠀⠀⡇⠀⠀
      ⠀⠀⠀⠀⠀⡇⢢⣄⣻⣧⠀⠈⠊⣑⡶⠚⠋⠀⠀⠀⠀⠀⠀⠈⠺⢦⡀⠰⣇⠀⠀⠀⠀⠀⠀⠀⠀⢀⡴⠛⡴⠋⣉⣠⣤⣀⠀⠀⠀⠀⠀⠀⠘⣖⠤⡀⡴⠋⠈⠧⣀⠀⡇⠀⠀
      ⠀⠀⠀⠀⢴⢳⠤⠗⠀⠈⣵⡤⠊⣽⠀⠀⣀⢤⣒⠶⣽⣛⣛⣲⡶⢤⣹⣏⡝⣆⠀⠀⠀⠀⠀⠀⠀⣸⢄⢒⢗⡯⠟⠒⠒⠐⠒⠒⠢⣄⡳⢢⡀⠘⢆⠈⠙⢄⡀⠀⣞⢰⠇⠀⠀
      ⠀⣀⠤⢤⣸⣸⢳⠄⣀⡴⢋⣀⡜⠀⣠⡮⣛⢽⠚⠉⢉⣮⢢⠙⢯⢳⠞⠢⡼⡻⣗⢤⡀⠀⠀⢀⠞⠁⢸⠁⡠⢇⠄⠀⠀⠀⠀⠀⠀⠀⠉⠢⡻⣦⡼⠊⠳⡐⡍⠙⠺⣾⠄⠀⠀
      ⠊⠸⠄⢀⡴⢽⣿⠞⡝⢠⠏⠀⡵⢾⣯⣞⣡⢼⠒⠉⠁⠈⡇⢇⢀⢣⠑⠦⠷⡀⠈⢯⠬⢷⡶⡋⠁⢀⠎⠉⢀⡎⡰⠀⠀⠀⠀⠀⠀⢀⠀⣖⠉⠹⣨⠦⠔⠃⠸⡄⠀⢹⡄⠀⠀
      ⠀⢀⡴⠋⢠⡿⠀⢰⠁⠀⠛⠙⣧⡞⠂⡽⠀⢸⢀⣀⡤⠤⢺⢸⠘⡆⣧⢃⠀⢱⡳⣌⢷⠯⣴⠃⠀⡎⢀⠏⣼⢠⠇⠀⠀⠀⠀⢀⡄⣼⠀⠈⠦⢼⠀⠀⠀⠀⠀⠃⠀⠀⡇⠀⠀
      ⢠⠎⠙⣲⢿⡇⠀⣷⠀⢀⡤⠊⢁⣏⠾⢷⠚⢹⡄⢧⠀⠀⣸⡎⡆⣿⢽⡿⡦⢄⣇⠙⣼⣄⠇⠀⢰⠁⣹⢩⠋⣿⠀⠀⢦⠀⠀⢸⢀⣿⣀⡄⠀⢸⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀
      ⡏⠀⡰⠃⣼⢗⢼⢸⠀⠉⢔⠀⡞⣄⣠⢼⡶⢺⢣⢸⡆⣠⠟⠀⡇⡎⣾⢱⣷⣐⣿⠘⡟⣿⠀⡀⡜⣶⣿⣾⣠⣿⡀⠀⠈⠃⢀⡏⡜⡜⢸⡏⠲⢬⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀
      ⠈⠒⢁⣼⡋⡿⣾⢸⡀⢦⢸⡀⢹⣯⠀⢸⡽⣜⣌⢯⣟⣄⣀⣀⣧⣧⡿⣿⢿⣿⡟⠀⡇⣿⠀⡇⠀⣿⠄⢯⢽⣿⠋⠉⠒⠒⠚⢟⣶⣧⣿⣤⣀⡸⠀⠀⡰⠀⠀⢀⠀⠀⢷⠀⠀
      ⠀⠐⣿⡳⢡⢻⡭⣇⡇⠘⡄⡇⠘⣿⣿⣿⣿⣿⡿⡆⠀⠀⠀⠀⠀⡟⡏⢻⠧⢻⣿⣄⡇⢸⡄⢱⠀⣿⠠⣧⣀⡼⠀⠀⠀⠀⠀⠀⢸⠯⢭⣗⣿⣷⠀⢠⠃⠀⡈⡸⠀⠀⠈⡆⠀
      ⠀⡸⠑⢡⢻⠀⢿⣯⡆⠀⢱⢹⡀⢻⣿⡟⢻⠙⡷⠀⠀⠀⠀⠀⠀⠙⠒⠊⠀⢻⡏⡽⡄⢸⡇⠀⢣⣵⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⢧⣀⠴⣻⠏⢠⠏⠀⢀⠇⡇⠀⠀⡄⢱⠀
      ⠄⠀⢀⠏⡞⠀⠀⠻⣿⠀⠀⢇⠳⡀⢣⡈⠓⠊⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣼⣷⣅⢧⡟⡇⠀⢸⢱⡈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡴⢁⡴⠃⠀⠀⡜⢸⠀⢰⢠⢃⢸⠀
      ⠀⣰⠏⣸⢋⣙⠳⣢⣻⣧⢆⠈⠧⡘⣦⣑⣄⡀⠀⠀⡴⠒⠒⠒⠖⠀⠀⠀⣩⡟⣼⡿⢸⣇⣇⠀⢸⢀⡗⢄⡀⠀⠀⠀⠀⠀⠀⠀⠐⠚⠓⣺⠃⠀⠀⠀⣰⢡⠇⠀⠎⡾⣣⢃⠤
      ⠀⠀⢠⡟⠛⠻⣆⠘⣽⢿⣯⢆⠀⠑⣼⣧⡉⠉⠀⠘⢤⣀⣀⡠⠃⢀⡤⢾⡁⢳⡇⠁⣿⡿⠹⣦⡀⡿⠀⠈⠻⣖⢤⣄⡀⢀⣀⣀⣀⣠⣴⠋⠀⠀⢠⡲⣿⠋⠀⢠⣾⠕⠙⣦⡀
      ⠀⠀⢹⠃⠀⠀⠈⠛⠋⠈⠻⣯⣦⠀⠀⠹⣿⢕⣒⣢⡤⣤⣤⡶⡾⣅⠉⢢⣱⣤⣇⠞⠁⠙⣆⠹⡙⠷⠀⠀⢴⠊⣹⡇⣼⠛⡻⠶⠾⢽⠃⠀⣀⡤⢷⡭⠷⣴⡴⠻⢧⣔⠒⠥⣙
      ⠀⢠⠛⡦⠤⠤⣤⣀⣀⣤⣴⡿⡿⡟⢶⣤⣝⣯⣻⢽⣀⣿⣸⡯⠙⣞⡢⣸⢏⠉⠛⣷⠀⠀⠘⢆⢧⠀⠀⠀⠀⣽⠃⠻⡿⣶⣯⣺⣄⣷⡞⣉⢿⢿⢸⣧⠔⣻⠹⡀⠀⠀⠑⢦⣌
      ⣠⡧⠚⣴⠾⠟⠰⡋⠀⢘⣻⠃⣿⡓⢤⣻⠿⢾⠧⠾⠟⢿⢋⣴⡪⣧⡷⠻⣮⣔⣛⣼⠀⠀⠀⠸⣼⠀⠀⢀⡴⢻⢣⣄⣸⣈⣛⡋⠘⡼⠉⠁⠘⡟⡎⢿⣯⢽⣄⠈⠳⣄⠀⠀⠀]]
      local pad = string.rep(" ", 22)
      local new_section = function(name, action, section)
        return { name = name, action = action, section = pad .. section }
      end

      local starter = require("mini.starter")

      local opts = {
        evaluate_single = true,
        header = logo,
        items = {
          new_section("Find file", "Pick files", "MiniPick (MiniExtra)"),
          new_section("Config", "e $MYVIMRC", "Config"),
          new_section("Lazy", "Lazy", "Config"),
          new_section("Quit", "qa", "Built-in"),
        },
        content_hooks = {
          starter.gen_hook.adding_bullet(pad .. "░ ", false),
          starter.gen_hook.aligning("center", "center"),
        },
        footer = "",
      }
      return opts
    end,
    config = function(_, opts)
      local starter = require("mini.starter")
      starter.setup(opts)
    end,
  },
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
    "echasnovski/mini.files",
    event = "VeryLazy",
    init = function()
      if vim.fn.argc() == 1 then
        local argv = vim.fn.argv(0)
        ---@diagnostic disable-next-line: param-type-mismatch
        local stat = vim.loop.fs_stat(argv)
        if stat and stat.type == "directory" then
          vim.fn.chdir(argv)
          vim.cmd("bd")
        end
      end
    end,
    opts = {
      options = { use_as_default_explorer = true },
      windows = {
        preview = false,
        width_focus = 70,
        width_preview = 50,
      },
      mappings = {
        go_in = "",
        go_in_plus = "<cr>",
        go_out = "",
        go_out_plus = "<bs>",
        reset = "",
      },
    },
    -- stylua: ignore
    keys = {
      { "<leader>e", function() require("mini.files").open(vim.api.nvim_buf_get_name(0), true) end, desc = "Open mini.files" },
      { "<leader>E", function() require("mini.files").open(vim.loop.cwd(), true) end, desc = "Open mini.files (cwd)" },
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
    "echasnovski/mini.comment",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      options = {
        custom_commentstring = function()
          return require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring
        end,
      },
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
          t = { "<([%p%w]-)%f[^<%w][^<>]->.-</%1>", "^<.->().*()</[^/]->$" },
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
  {
    "echasnovski/mini.pick",
    event = "VeryLazy",
    opts = {},
    dependencies = { "echasnovski/mini.extra" },
    -- stylua: ignore
    keys = {
      { "<leader>/", "<cmd>Pick grep_live<cr>", desc = "Live Grep" },
      { "<leader>fe", "<cmd>Pick explorer<cr>", desc = "Explorer" },
      { "<leader>ff", "<cmd>Pick files<cr>", desc = "Find Files" },
      { "<leader>fb", "<cmd>Pick buffers<cr>", desc = "Buffers" },
      { "<leader>fd", "<cmd>Pick diagnostic<cr>", desc = "Diagnostic" },
      { "<leader>fg", "<cmd>Pick grep<cr>", desc = "Grep" },
      { "<leader>ft", "<cmd>Pick treesitter<cr>", desc = "Treesitter Node" },
    },
  },
  { "echasnovski/mini.extra", event = "VeryLazy", opts = {} },
  { "echasnovski/mini.icons", event = "VeryLazy", opts = {} },
}
