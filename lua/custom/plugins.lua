local plugins = {
  -- {
  --   "mxsdev/nvim-dap-vscode-js",
  --   event = "VeryLazy",
  --   ft = { "javascript", "typescript", "typescriptreact" },
  --   dependencies = { "mfussenegger/nvim-dap", "rcarriga/nvim-dap-ui" },
  --   config = function()
  --     require("dap-vscode-js").setup {
  --       adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
  --     }
  --   end,
  -- },
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require "dap"
      local dapui = require "dapui"
      require("dapui").setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
        print "initialized"
      end
      -- dap.listeners.before.event_terminated["dapui_config"] = function()
      --   dapui.close()
      --
      --   print "terminated"
      -- end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()

        print "exited"
      end
    end,
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
      require "custom.configs.dap"
      require("core.utils").load_mappings "dap"
    end,
  },
  {
    "mhartington/formatter.nvim",
    event = "VeryLazy",
    opts = function()
      return require "custom.configs.formatter"
    end,
  },
  {
    "mfussenegger/nvim-lint",
    event = "VeryLazy",
    config = function()
      require "custom.configs.lint"
    end,
  },
  {
    {
      "williamboman/mason.nvim",
      opts = {
        ensure_installed = {
          "eslint-lsp",
          "prettier",
          "js-debug-adapter",
          "stylua",
          "typescript-language-server",
          "clangd",
          "clang-format",
        },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
}

return plugins
