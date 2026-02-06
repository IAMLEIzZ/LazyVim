return {
  -- 确保 treesitter 支持 Go
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "go", "gomod", "gowork", "gosum" })
    end,
  },

  -- 启用 Go LSP 和调试支持
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        gopls = {
          settings = {
            gopls = {
              analyses = {
                unusedparams = true,
                shadow = true,
              },
              staticcheck = true,
              gofumpt = true,
            },
          },
        },
      },
    },
  },
  -- nvim-dap
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "leoluz/nvim-dap-go", -- Go 专用适配器
    },
    config = function()
      local dap = require("dap")

      -- 关键：覆盖 LazyVim 的断点符号
      vim.fn.sign_define("DapBreakpoint", {
        text = "",
        texthl = "DiagnosticError",
      })

      vim.fn.sign_define("DapStopped", {
        text = "",
        texthl = "DiagnosticWarn",
      })

      vim.fn.sign_define("DapBreakpointRejected", {
        text = "",
        texthl = "DiagnosticInfo",
      })

      -- 配置 delve
      require("dap-go").setup({
        delve = {
          path = "/Users/iamleizz/.gvm/pkgsets/go1.25.3/global/bin/dlv",
          initialize_timeout_sec = 20,
          port = 38697,
        },
      })
    end,
  },
  -- DAP UI（调试界面）
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      
      dapui.setup()
      
      -- 自动打开/关闭调试 UI
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
}
