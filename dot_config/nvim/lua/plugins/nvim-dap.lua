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

        vim.g.dotnet_build_project = function()
            local default_path = vim.fn.getcwd() .. '/'
            if vim.g['dotnet_last_proj_path'] ~= nil then
                default_path = vim.g['dotnet_last_proj_path']
            end
            local path = vim.fn.input('Path to your *proj file', default_path, 'file')
            vim.g['dotnet_last_proj_path'] = path
            local cmd = 'dotnet build -c Debug ' .. path .. ' > /dev/null'
            print('')
            print('Cmd to execute: ' .. cmd)
            local f = os.execute(cmd)
            if f == 0 then
                print('\nBuild: ✔️ ')
            else
                print('\nBuild: ❌ (code: ' .. f .. ')')
            end
        end

        vim.g.dotnet_get_dll_path = function()
            local request = function()
                return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
            end

            if vim.g['dotnet_last_dll_path'] == nil then
                vim.g['dotnet_last_dll_path'] = request()
            else
                if vim.fn.confirm('Do you want to change the path to dll?\n' .. vim.g['dotnet_last_dll_path'], '&yes\n&no', 2) == 1 then
                    vim.g['dotnet_last_dll_path'] = request()
                end
            end

            return vim.g['dotnet_last_dll_path']
        end

        dap.configurations.cs = {
            {
                type = "coreclr",
                name = "launch - netcoredbg",
                request = "launch",
                program = function()
                    if vim.fn.confirm('Should I recompile first?', '&yes\n&no', 2) == 1 then
                        vim.g.dotnet_build_project()
                    end
                    return vim.g.dotnet_get_dll_path()
                end,
            },
        }
        -- dap.configurations.cs = {
        --     {
        --         type = "coreclr",
        --         name = "launch - netcoredbg",
        --         request = "launch",
        --         program = function()
        --             return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
        --         end,
        --     },
        -- }

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
                ghciPrompt = "ghci> ",
                -- WARNING: Adjust the prompt to the prompt you see when you invoke the stack ghci command below
                -- This is essential otherwise the debug adapter will not respond
                ghciInitialPrompt = "ghci> ",
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
