return function()

    require("noice").setup(
        {
            lsp = {
                -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true,
                },
            },
            cmdline = {
                enabled = true, -- enables the Noice cmdline UI
                view = "cmdline_popup", -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
                opts = { buf_options = { filetype = "vim" } }, -- enable syntax highlighting in the cmdline
                format = {
                    -- conceal: (default=true) This will hide the text in the cmdline that matches the pattern.
                    -- view: (default is cmdline view)
                    -- opts: any options passed to the view
                    -- icon_hl_group: optional hl_group for the icon
                    cmdline = { pattern = "^:", icon = "" },
                    search_down = { kind = "search", pattern = "^/", icon = " ", ft = "regex" },
                    search_up = { kind = "search", pattern = "^%?", icon = " ", ft = "regex" },
                    filter = { pattern = "^:%s*!", icon = "$", ft = "sh" },
                    lua = { pattern = "^:%s*lua%s+", icon = "", ft = "lua" },
                    -- lua = false, -- to disable a format, set to `false`
                },
            },
            messages = {
                -- NOTE: If you enable messages, then the cmdline is enabled automatically.
                -- This is a current Neovim limitation.
                enabled = true, -- enables the Noice messages UI
                view = "mini", -- default view for messages
                view_error = "notify", -- view for errors
                view_warn = "notify", -- view for warnings view_history = "split", -- view for :messages
                view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
            },
            popupmenu = {
                enabled = true, -- enables the Noice popupmenu UI
                backend = "nui", -- backend to use to show regular cmdline completions
            },
            history = {
                -- options for the message history that you get with `:Noice`
                view = "split",
                opts = { enter = false, format = "details" },
                filter = { event = { "msg_show", "notify" }, ["not"] = { kind = { "search_count", "echo" } } },
            },
            notify = {
                -- Noice can be used as `vim.notify` so you can route any notification like other messages
                -- Notification messages have their level and other properties set.
                -- event is always "notify" and kind can be any log level as a string
                -- The default routes will forward notifications to nvim-notify
                -- Benefit of using Noice for this is the routing and consistent history view
                enabled = true,
                view = "notify",
            },
            lsp_progress = {
                enabled = true,
                format = "lsp_progress",
                format_done = "lsp_progress_done",
                throttle = 1000 / 33, -- frequency to update lsp progress message
                view = "notify",
            },
            throttle = 1000 / 33, -- how frequently does Noice need to check for ui updates? This has no effect when in blocking mode.
            -- views = {}, ---@see section on views
            views = {
                cmdline_popup = {
                    position = {
                        row = "35%",
                        col = "50%",
                    },
                    size = {
                        width = 60,
                        height = "auto",
                    },
                },
                popupmenu = {
                    relative = "editor",
                    position = {
                        row = "47%",
                        col = "50%",
                    },
                    size = {
                        width = 60,
                        height = 10,
                    },
                    border = {
                        style = "rounded",
                        padding = { 0, 1 },
                    },
                    win_options = {
                        winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
                    },
                },
                notify = {
                    replace = true
                }
            },
            routes = {}, --- @see section on routes
            status = {}, --- @see section on statusline components
            format = {}, --- @see section on formatting
        }
    )

end
