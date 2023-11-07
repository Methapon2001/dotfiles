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
          new_section("Find file", "Telescope find_files", "Telescope"),
          new_section("Recent files", "Telescope oldfiles", "Telescope"),
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

      vim.api.nvim_create_autocmd("User", {
        pattern = "LazyVimStarted",
        callback = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          local pad_footer = string.rep(" ", 8)
          starter.config.footer = pad_footer .. "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
          pcall(starter.refresh)
        end,
      })
    end,
  },
  {
    "echasnovski/mini.animate",
    event = "VeryLazy",
    opts = function()
      -- don't use animate when scrolling with the mouse
      local mouse_scrolled = false
      for _, scroll in ipairs({ "Up", "Down" }) do
        local key = "<ScrollWheel" .. scroll .. ">"
        vim.keymap.set({ "", "i" }, key, function()
          mouse_scrolled = true
          return key
        end, { expr = true })
      end

      local animate = require("mini.animate")
      return {
        resize = {
          timing = animate.gen_timing.linear({ duration = 100, unit = "total" }),
        },
        scroll = {
          timing = animate.gen_timing.linear({ duration = 150, unit = "total" }),
          subscroll = animate.gen_subscroll.equal({
            predicate = function(total_scroll)
              if mouse_scrolled then
                mouse_scrolled = false
                return false
              end
              return total_scroll > 1
            end,
          }),
        },
      }
    end,
  },
  {
    "echasnovski/mini.statusline",
    event = "VeryLazy",
    opts = {},
  },
  {
    "echasnovski/mini.tabline",
    event = "VeryLazy",
    opts = {},
  },
  {
    "echasnovski/mini.bufremove",
    event = "VeryLazy",
    -- stylua: ignore
    keys = {
      { "<leader>bd", function() require("mini.bufremove").delete(0, false) end, desc = "Delete Buffer" },
      { "<leader>bD", function() require("mini.bufremove").delete(0, true) end, desc = "Delete Buffer (Force)" },
    },
  },
  {
    "echasnovski/mini.files",
    init = function()
      if vim.fn.argc() == 1 then
        local argv = vim.fn.argv(0)
        ---@diagnostic disable-next-line: param-type-mismatch
        local stat = vim.loop.fs_stat(argv)
        if stat and stat.type == "directory" then
          vim.fn.chdir(argv)
          vim.cmd("bd")
          -- require("mini.files").open(vim.loop.cwd(), true)
        end
      end
    end,
    opts = {
      windows = {
        preview = true,
        width_focus = 30,
        width_preview = 70,
      },
      options = {
        use_as_default_explorer = true,
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
    "echasnovski/mini.pairs",
    event = "VeryLazy",
    opts = {},
  },
  {
    "echasnovski/mini.comment",
    event = "VeryLazy",
    opts = {},
  },
  {
    "echasnovski/mini.surround",
    event = "VeryLazy",
    opts = {
      mappings = {
        add = "sa",
        delete = "sd",
        find = "",
        find_left = "",
        highlight = "sh",
        replace = "sr",
        update_n_lines = "",

        suffix_last = "",
        suffix_next = "",
      },
    },
  },
  {
    "echasnovski/mini.ai",
    event = "VeryLazy",
    dependencies = { "nvim-treesitter-textobjects" },
    opts = function()
      local ai = require("mini.ai")
      return {
        n_lines = 500,
        custom_textobjects = {
          o = ai.gen_spec.treesitter({
            a = { "@block.outer", "@conditional.outer", "@loop.outer" },
            i = { "@block.inner", "@conditional.inner", "@loop.inner" },
          }, {}),
          f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }, {}),
          c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }, {}),
        },
      }
    end,
  },
}
