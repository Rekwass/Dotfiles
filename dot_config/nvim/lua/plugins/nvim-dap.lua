return {
    "mfussenegger/nvim-dap",
    config = function()
        local dap = require("dap")


        -- .NET C#
        dap.adapters.coreclr = {
            type = "executable",
            command = require("mason-registry").get_package("netcoredbg").get_install_path("netcoredbg") ..
                "/netcoredbg/netcoredbg",
            args = { '--interpreter=vscode' },
        }
        dap.configurations.cs = {
            {
                type = "coreclr",
                name = "launch - netcoredbg",
                request = "launch",
                program = function()
                    return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
                end,
            },
        }

        -- Haskell
        dap.adapters.haskell = {
            type = 'executable',
            command = 'haskell-debug-adapter',
            args = { '--hackage-version=0.0.33.0' },
        }
        dap.configurations.haskell = {
            {
                type = 'haskell',
                request = 'launch',
                name = 'Debug',
                workspace = '${workspaceFolder}',
                startup = "${file}",
                stopOnEntry = true,
                logFile = vim.fn.stdpath('data') .. '/haskell-dap.log',
                logLevel = 'WARNING',
                ghciEnv = vim.empty_dict(),
                ghciPrompt = "λ: ",
                -- Adjust the prompt to the prompt you see when you invoke the stack ghci command below
                ghciInitialPrompt = "λ: ",
                ghciCmd = "stack ghci --test --no-load --no-build --main-is TARGET --ghci-options -fprint-evld-with-show",
            },
        }

        -- C, C++

        dap.adapters.codelldb = {
            type = "server",
            port = "${port}",
            executable = {
                command = require("mason-registry").get_package("codelldb").get_install_path("codelldb") ..
                    "/codelldb/extension/adapter/codelldb",
                args = { "--port", "${port}" },
            }
        }

        dap.configurations.cpp = {
            {
                name = "Launch file",
                type = "codelldb",
                request = "launch",
                program = function()
                    return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                end,
                cwd = "${workspaceFolder}",
                stopOnEntry = false,
            },
        }
        dap.configurations.c = dap.configurations.cpp
    end,
}
