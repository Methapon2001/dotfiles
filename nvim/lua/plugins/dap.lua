---@module "lazy.types"
---@type LazySpec|LazySpec[]
return {
  {
    "igorlfs/nvim-dap-view",
    lazy = false,
    ---@module 'dap-view'
    ---@type dapview.Config
    opts = {
      auto_toggle = true,
    },
  },
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      { "igorlfs/nvim-dap-view" },
      { "theHamsta/nvim-dap-virtual-text", opts = {} },
    },
    -- stylua: ignore
    keys = {
      { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
      { "<leader>dc", function() require("dap").continue() end, desc = "Run/Continue" },
      { "<leader>dt", function() require("dap").terminate({ all = true }) end, desc = "Terminate" },
      { "<leader>dh", function() require("dap.ui.widgets").hover() end, desc = "Terminate" },
      { "<F10>", function() require("dap").step_over() end, desc = "Step Over" },
      { "<F11>", function() require("dap").step_into() end, desc = "Step Into" },
      { "<S-F11>", function() require("dap").step_out() end, desc = "Step Out" },
    },
    config = function()
      vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })

      for name, sign in pairs({
        Stopped = { "󰁕 ", "DiagnosticWarn", "DapStoppedLine" },
        Breakpoint = { " " },
        BreakpointCondition = { " " },
        BreakpointRejected = { " ", "DiagnosticError" },
        LogPoint = { ".>" },
      }) do
        vim.fn.sign_define(
          "Dap" .. name,
          { text = sign[1], texthl = sign[2] or "DiagnosticInfo", linehl = sign[3], numhl = sign[3] }
        )
      end
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = "mason.nvim",
    cmd = { "DapInstall", "DapUninstall" },
    opts = {
      automatic_installation = true,
    },
  },
}
