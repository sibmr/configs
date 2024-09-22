return {
    {
        "mfussenegger/nvim-dap",
        keys = {
            {
                '<F5>',
                function() require('dap').continue() end,
                mode = { "n" }
            },
            {
                '<F10>',
                function() require('dap').step_over() end,
                mode = { "n" }
            },
            {
                '<F11>',
                function() require('dap').step_into() end,
                mode = { "n" }
            },
            {
                '<F12>',
                function() require('dap').step_out() end,
                mode = { "n" }
            },
            {
                '<Leader>b',
                function() require('dap').toggle_breakpoint() end,
                mode = { "n" }
            },
            {
                '<Leader>B',
                function() require('dap').set_breakpoint() end,
                mode = { "n" }
            },
            {
                '<Leader>lp',
                function()
                    require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))
                end,
                mode = { "n" }
            },
            {
                '<Leader>dr',
                function() require('dap').repl.open() end,
                mode = { "n" }
            },
            {
                '<Leader>dl',
                function() require('dap').run_last() end,
                mode = { "n" }
            },
            {
                '<Leader>dh',
                function()
                    require('dap.ui.widgets').hover()
                end,
                mode = {'n', 'v'}
            },
            {
                '<Leader>dp',
                function()
                    require('dap.ui.widgets').preview()
                end,
                mode = {'n', 'v'}
            },
            {
                '<Leader>df',
                function()
                    local widgets = require('dap.ui.widgets')
                    widgets.centered_float(widgets.frames)
                end,
                mode = { "n" }
            },
            {
                '<Leader>ds',
                function()
                    local widgets = require('dap.ui.widgets')
                    widgets.centered_float(widgets.scopes)
                end,
                mode = { "n" }
            },
        },
        config = function(_,_)
            local dap = require("dap")

            dap.adapters.gdb = {
                type = "executable",
                command = "gdb",
                args = { "-i", "dap" }
            }

            dap.adapters.cppdbg = {
                id = "cppdbg",
                type = "executable",
                command = 'OpenDebugAD7',
                options = {
                    detached = false
                }
            }

            dap.configurations.cpp = {
                {
                    name = "Launch file",
                    type = "cppdbg",
                    request = "launch",
                    program = function()
                        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                    end,
                    cwd = '${workspaceFolder}',
                    stopAtEntry = true,
                },
                {
                    name = 'Attach to gdbserver :1234',
                    type = 'cppdbg',
                    request = 'launch',
                    MIMode = 'gdb',
                    miDebuggerServerAddress = 'localhost:1234',
                    miDebuggerPath = '/usr/bin/gdb',
                    cwd = '${workspaceFolder}',
                    program = function()
                        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                    end,
                },
                {
                    name = "Launch with gdb (only newer gdb versions)",
                    type = "gdb",
                    program = function()
                        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                    end,
                    cwd = "${workspaceFolder}",
                }
            }
        end,
    },
    {
        "rcarriga/nvim-dap-ui",
        keys = {
          {
            'du',
            function() require('dapui').toggle() end,
            mode = { "n" }
          }
        },
        config = function(_,_)
            require('dapui').setup()
        end,
    },
}
