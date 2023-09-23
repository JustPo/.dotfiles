return {
  'rcarriga/nvim-dap-ui',
  dependencies = {
    "mfussenegger/nvim-dap",
  },
  lazy = true,
  keys = {
    {
      "<leader>dc",
      function()
        require('dap').continue()
      end,
      desc = "Debug continue",
    },
    {
      "<leader>db",
      function()
        require('dap').toggle_breakpoint()
      end,
      desc = "Toggle breakpoint",
    },
    {
      "<leader>dt",
      function()
        require('dap').terminate()
      end,
      desc = "Debug terminate",
    },
  },
  config = function()
    local dap_ui = require("dapui")
    dap_ui.setup({
      controls = {
        element = "repl",
        enabled = true,
        icons = {
          disconnect = "",
          pause = "",
          play = "",
          run_last = "",
          step_back = "",
          step_into = "",
          step_out = "",
          step_over = "",
          terminate = ""
        }
      }
    })
    local dap = require('dap')
    dap.adapters.codelldb_swift = {
      type = 'server',
      port = "${port}",
      executable = {
        command = '/Users/personal/Downloads/codelldb/extension/adapter/codelldb',
        args = { "--port", "${port}", "--liblldb",
          "/Applications/Xcode.app/Contents/SharedFrameworks/LLDB.framework/Versions/A/LLDB",
          "--settings", '{"evaluateForHovers":true,"commandCompletions":true,"sourceLanguages":["swift"]' },
      }
    }

    dap.configurations.swift = {
      {
        name = 'lldb_swift',
        type = 'codelldb_swift',
        request = 'launch',
        program = function()
          return vim.fn.getcwd() .. '/.build/debug/testExecutable'
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        expressions = "native",
        args = {
          "--settings", '{"evaluateForHovers":true,"commandCompletions":true,"sourceLanguages":["swift"]'
        }
      },
    }

    dap.configurations.rust = {
      {
        name = 'Test',
        type = 'lldb',
        request = 'launch',
        program = function()
          return vim.fn.getcwd() .. '/target/debug/rust_tesst'
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        args = {},
      },
    }
    dap.listeners.after.event_initialized["dapui_config"] = function()
      require('dap.ext.autocompl').attach()
      dap_ui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dap_ui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dap_ui.close()
    end
  end,
}
