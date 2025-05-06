return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
        {
            "<leader>f",
            function()
                require("conform").format({ async = true })
            end,
            mode = "",
            desc = "Format buffer",
        }, {
        "<leader>ft",
        "<Cmd>FormatToggle<CR>",
        mode = "",
        desc = "Toggle format for the current buffer",
    },
        {
            "<leader>fT",
            "<Cmd>FormatToggle!<CR>",
            mode = "",
            desc = "Toggle format for all buffers",
        }
    },
    ---@module "conform"
    ---@diagnostic disable-next-line: undefined-doc-name
    ---@type conform.setupOpts
    opts = {
        -- Define your formatters
        formatters_by_ft = {
            python = { "isort", "autopep8" },
            cs = { "csharpier" },
        },
        -- Set default options
        default_format_opts = {
            lsp_format = "fallback",
        },
        -- Set up format-on-save
        format_on_save = function(bufnr)
            -- Disable autoformat on certain filetypes
            local ignore_filetypes = { "haskell" }
            if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
                return
            end
            -- Disable with a global or buffer-local variable
            if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
                return
            end
            -- Disable autoformat for files in a certain path
            local bufname = vim.api.nvim_buf_get_name(bufnr)
            if bufname:match("/node_modules/") then
                return
            end

            return { timeout_ms = 1000, lsp_format = "fallback" }
        end,
    },
    init = function()
        -- If you want the formatexpr, here is the place to set it
        vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
}
