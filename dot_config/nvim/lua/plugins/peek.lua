return {
    "toppair/peek.nvim",
    event = { "VeryLazy" },
    ft = { "markdown" },
    cmd = "PeekOpen",
    build = "deno task --quiet build:fast",
    config = function()
        require("peek").setup(
            {
                auto_load = true,        -- whether to automatically load preview when
                -- entering another markdown buffer
                close_on_bdelete = true, -- close preview window on buffer delete

                syntax = true,           -- enable syntax highlighting, affects performance

                theme = 'light',         -- 'dark' or 'light'

                update_on_change = true,

                app = 'webview', -- 'webview', 'browser', string or a table of strings
                -- explained below

                filetype = { 'markdown' }, -- list of filetypes to recognize as markdown

                -- relevant if update_on_change is true
                throttle_at = 200000,   -- start throttling when file exceeds this
                -- amount of bytes in size
                throttle_time = 'auto', -- minimum amount of time in milliseconds
                -- that has to pass before starting new render
            }
        )

        vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
        vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})

        vim.api.nvim_create_autocmd({ "BufEnter" }, {
            desc = "Open markdown preview automatically",

            pattern = { "*.md" },
            group = vim.api.nvim_create_augroup("Markdown preview", { clear = true }),
            command = ":lua require(\"peek\").open()"
            -- If it opens multiple time or regain focus use the callback below
            --[[callback = function()
                if require("peek").is_open() == false then
                    require("peek").open()
                end
            end]]
        })
    end,
}
