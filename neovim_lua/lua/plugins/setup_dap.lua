return {
    {
        "mfussenegger/nvim-dap",
        keys = {
            {
                "<F2>",
                function()
                    require("dap").continue()
                end,
                mode = { "n", "i", "v" }
            },
            {
                "<F3>",
                function()
                    require("dap").step_over()
                end,
                mode = { "n", "i", "v" }
            },
            {
                "<F4>",
                function()
                    require("dap").step_into()
                end,
                mode = { "n", "i", "v" }
            },
            {
                "<F5>",
                function()
                    require("dap").repl.open()
                end,
                mode = { "n", "i", "v" }
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
}
