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
    keys = {
        { "<leader>bp",  "<cmd>lua require(\"dap\").toggle_breakpoint()<CR>", desc = "Toggle breakpoint",           silent = true, },
        { "<leader>bpc", "<cmd>lua require(\"dap\").clear_breakpoints()<CR>", desc = "Clear breakpoints",           silent = true, },
        { "<leader>so",  "<cmd>lua require(\"dap\").step_over()<CR>",         desc = "Step to next instruction",    silent = true, },
        { "<leader>dc",  "<cmd>lua require(\"dap\").continue()<CR>",          desc = "Continue to next breakpoint", silent = true, },
        { "<leader>dl",  "<cmd>lua require(\"dap\").run_last()<CR>",          desc = "Continue to last breakpoint", silent = true, },
    }
}
