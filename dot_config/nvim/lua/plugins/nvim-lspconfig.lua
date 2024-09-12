return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "Hoffs/omnisharp-extended-lsp.nvim"
    },
    config = function()
        local borderStyle = "rounded"

        -- Override popup borders globally
        local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
        function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
            opts = opts or {}
            opts.border = opts.border or borderStyle
            return orig_util_open_floating_preview(contents, syntax, opts, ...)
        end

        -- Customise `LspInfo` borders as they are a separate kind
        local windows = require 'lspconfig.ui.windows'
        windows.default_options.border = borderStyle

        -- Display diagnostic automatically when holding hover a line in normal mode
        vim.api.nvim_create_autocmd({ "CursorHold" }, {
            group = vim.api.nvim_create_augroup("float_diagnostic", { clear = true }),
            callback = function()
                -- Retrieve every windows in the current buffer
                for _, winid in pairs(vim.api.nvim_tabpage_list_wins(0)) do
                    -- Check if the window has a `.zindex` set, it means that a floating window is currently opened
                    if vim.api.nvim_win_get_config(winid).zindex ~= nil then
                        return
                    end
                end
                -- If not, open the float diagnostic
                vim.diagnostic.open_float({ focusable = false })
            end
        })

        local utils = require("utils")

        -- Define keybindings locally when attaching an LSP to a buffer
        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(args)
                local bufnr = args.buf
                -- local client = vim.lsp.get_client_by_id(args.data.client_id)

                local function buf_set_keymap(...) utils.buf_map(bufnr, ...) end

                -- `client.supports_method` is not as reliable because of dynamic capability
                -- https://github.com/neovim/neovim/issues/24229
                -- Keep an eye on this PR, as `client.supports_method` returns many MANY times false (dynamic capabilities)
                -- https://github.com/neovim/neovim/pull/22598
                -- For now, simply assign these even if the LSP does not support it, I will get red text anyway instead of moving to a random location while highlighting a word
                -- if client.supports_method("textDocument/definition") then
                buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>")
                -- end

                -- if client.supports_method("textDocument/declaration") then
                buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>")
                -- end

                -- if client.supports_method("textDocument/implementation") then
                buf_set_keymap("n", "gi", "<Cmd>lua vim.lsp.buf.implementation()<CR>")
                -- end

                -- if client.supports_method("textDocument/references") then
                buf_set_keymap("n", "gr", "<Cmd>lua vim.lsp.buf.references()<CR>")
                -- end

                -- if client.supports_method('textDocument/rename') then
                buf_set_keymap("n", "<leader>rn", "<Cmd>lua vim.lsp.buf.rename()<CR>")
                -- end
            end,
        })

        -- Indentation to 2 locally on buffers of certain filetypes
        vim.api.nvim_create_autocmd("FileType", {
            desc = "Set indentation to 2 for certain filetypes",
            pattern = { "typescript", "javascript", "html", "json", "yaml" },
            group = vim.api.nvim_create_augroup("indent_of_two", { clear = true }),
            callback = function()
                vim.opt_local.shiftwidth = 2 -- Number of spaces for auto-indent
                vim.opt_local.tabstop = 2    -- Number of spaces per tab
            end,
        })

        local lsps = require("plugins.lsp")

        lsps.setupAll();
    end,
}
