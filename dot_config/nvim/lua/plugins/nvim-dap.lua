return {
    "mfussenegger/nvim-dap",
    config = function()
        local dap = require("dap")

        -- .NET C#
        dap.adapters.netcoredbg = {
            type = "executable",
            command = "netcoredbg",
            args = { "--interpreter=vscode" },
        }

        dap.configurations.cs = {
            {
                type = "netcoredbg",
                name = "attach - netcoredbg",
                request = "attach",
                processId = function()
                    return require("dap.utils").pick_process({ filter = ".*/bin/Debug/.*" })
                end,
            },
        }

        -- Haskell
        dap.adapters.haskell_debug_adapter = {
            type = 'executable',
            command = 'haskell-debug-adapter',
            args = { '--hackage-version=0.0.33.0' },
        }
        dap.configurations.haskell = {
            {
                type = 'haskell_debug_adapter',
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

        -- Python
        dap.adapters.debugpy = function(cb, _)
            local port
            if vim.g['debugpy_last_port'] ~= nil then
                port = vim.g['debugpy_last_port']
            else
                port = tonumber(vim.fn.input("Port: "))
                vim.g['debugpy_last_port'] = port
            end
            local host = '127.0.0.1'
            cb({
                type = 'server',
                port = assert(port, '`connect.port` is required for a python `attach` configuration'),
                host = host,
                options = {
                    source_filetype = 'python',
                },
            })
        end

        dap.configurations.python = {
            {
                type = 'debugpy',
                request = 'attach',
                name = "Launch file",
                -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

                program = "${file}", -- This configuration will launch the current file if used.
                pythonPath = function()
                    local cwd = vim.fn.getcwd()
                    if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
                        return cwd .. '/venv/bin/python'
                    elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
                        return cwd .. '/.venv/bin/python'
                    else
                        return '/opt/homebrew/bin/python3'
                    end
                end,
            },
        }
    end,
    keys = {
        { "<leader>bp",  "<cmd>lua require(\"dap\").toggle_breakpoint()<CR>", desc = "Toggle breakpoint",           silent = true, },
        { "<leader>bpc", "<cmd>lua require(\"dap\").clear_breakpoints()<CR>", desc = "Clear breakpoints",           silent = true, },
        { "<leader>so",  "<cmd>lua require(\"dap\").step_over()<CR>",         desc = "Step to next instruction",    silent = true, },
        { "<leader>dc",  "<cmd>lua require(\"dap\").continue()<CR>",          desc = "Continue to next breakpoint", silent = true, },
        { "<leader>dl",  "<cmd>lua require(\"dap\").run_last()<CR>",          desc = "Continue to last breakpoint", silent = true, },
        { "<leader>dq",  "<cmd>lua require(\"dap\").terminate()<CR>",         desc = "Terminate session",           silent = true, },
    }
}
