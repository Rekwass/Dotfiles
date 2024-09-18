return {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")

        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end

        local default_config = {
            icons = { expanded = "", collapsed = "", current_frame = "" },
            mappings = {
                -- Use a table to apply multiple mappings
                expand = { "<CR>", "<2-LeftMouse>" },
                open = "o",
                remove = "d",
                edit = "e",
                repl = "r",
                toggle = "t",
            },
            element_mappings = {},
            expand_lines = vim.fn.has("nvim-0.7") == 1,
            force_buffers = true,
            layouts = {
                {
                    -- You can change the order of elements in the sidebar
                    elements = {
                        -- Provide IDs as strings or tables with "id" and "size" keys
                        {
                            id = "scopes",
                            size = 0.25, -- Can be float or integer > 1
                        },
                        { id = "breakpoints", size = 0.25 },
                        { id = "stacks",      size = 0.25 },
                        { id = "watches",     size = 0.25 },
                    },
                    size = 40,
                    position = "left", -- Can be "left" or "right"
                },
                {
                    elements = {
                        "repl",
                        "console",
                    },
                    size = 10,
                    position = "bottom", -- Can be "bottom" or "top"
                },
            },
            floating = {
                max_height = nil,
                max_width = nil,
                border = "rounded",
                mappings = {
                    ["close"] = { "q", "<Esc>" },
                },
            },
            controls = {
                enabled = vim.fn.exists("+winbar") == 1,
                element = "repl",
                icons = {
                    pause = "",
                    play = "",
                    step_into = "",
                    step_over = "",
                    step_out = "",
                    step_back = "",
                    run_last = "",
                    terminate = "",
                    disconnect = "",
                },
            },
            render = {
                max_type_length = nil, -- Can be integer or nil.
                max_value_lines = 100, -- Can be integer or nil.
                indent = 1,
            },
        }

        dapui.setup(default_config)
    end,
    keys = {
        { "<leader>bp", "<cmd>lua require(\"dap\").toggle_breakpoint()<CR>", desc = "Toggle breakpoint",           silent = true, },
        { "<leader>so", "<cmd>lua require(\"dap\").step_over()<CR>",         desc = "Toggle breakpoint",           silent = true, },
        { "<leader>dc", "<cmd>lua require(\"dap\").continue()<CR>",          desc = "Continue to next breakpoint", silent = true, },
        { "<leader>dl", "<cmd>lua require(\"dap\").run_last()<CR>",          desc = "Continue to next breakpoint", silent = true, },
    }
}
