local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ","

-- Define prefix and signs for diagnostics (LSP, and potentially other external sources)
local s = vim.diagnostic.severity
vim.diagnostic.config({
    virtual_text = {
        prefix = '', -- Could be '●', '▎', 'x'
    },
    signs = { text = { [s.ERROR] = " ", [s.WARN] = " ", [s.INFO] = " ", [s.HINT] = "󰌵" } }
})

-- Define prefix and signs for DAP
vim.fn.sign_define('DapBreakpoint',
    { text = '', texthl = 'DiagnosticError', linehl = 'ColorColumn', numhl = 'ColorColumn' })
vim.fn.sign_define('DapBreakpointCondition',
    { text = 'ﳁ', texthl = 'DiagnosticError', linehl = 'ColorColumn', numhl = 'ColorColumn' })
vim.fn.sign_define('DapBreakpointRejected',
    { text = '', texthl = 'DiagnosticError', linehl = 'ColorColumn', numhl = 'ColorColumn' })

vim.fn.sign_define('DapLogPoint',
    { text = '', texthl = 'DiagnosticInfo', linehl = 'ColorColumn', numhl = 'ColorColumn' })
vim.fn.sign_define('DapStopped',
    { text = '', texthl = 'DiagnosticOk', linehl = 'DiagnosticVirtualTextOk', numhl = 'DiagnosticVirtualTextOk' })

vim.b.disable_autoformat = false
vim.g.disable_autoformat = false

vim.api.nvim_create_user_command("FormatToggle", function(args)
    if args.bang then
        -- FormatDisable! will toggle formatting globally
        vim.g.disable_autoformat = not vim.g.disable_autoformat
        if vim.g.disable_autoformat == false then
            vim.b.disable_autoformat = false
        end
    else
        vim.b.disable_autoformat = not vim.b.disable_autoformat
    end
end, {
    desc = "Toggle autoformat-on-save",
    bang = true,
})

vim.api.nvim_create_autocmd("BufEnter", {
    desc = "Disable comment on new line",
    group = vim.api.nvim_create_augroup("Comment", { clear = true }),
    command = "set formatoptions-=cro"
})

require("lazy").setup({
    change_detection = {
        -- automatically check for config file changes and reload the ui
        enabled = false,
        notify = false, -- get a notification when changes are found
    },
    spec = {
        {
            -- Color theme
            import = "plugins.nightfox",
            -- import = "plugins.tokyonight",
        },
        {
            import = "plugins.nvim-notify",
            enabled = false,
            -- Nvim notifications
        },
        {
            -- Portable package manager (LSP, DAP, Linters, ...)
            import = "plugins.mason",
        },
        {
            -- Package manager lspconfig
            import = "plugins.mason-lspconfig",
        },
        {
            -- Enhanced colors and highlighting
            import = "plugins.nvim-treesitter",
        },
        {
            -- Buffers on top of the screen
            import = "plugins.bufferline",
        },
        {
            -- Line on the bottom of the screen
            import = "plugins.lualine",
        },
        {
            -- WARNING: Heavy lags coming from this plugin on files > 500 lines
            -- Scrollbar on the right of the screen
            import = "plugins.nvim-scrollbar",
        },
        {
            -- DAP
            import = "plugins.nvim-dap",
        },
        {
            -- DAP User interface
            import = "plugins.nvim-dap-ui",
        },
        {
            -- Haskell tools, lsp and much more
            import = "plugins.haskell-tools"
        },
        {
            -- LSP
            import = "plugins.nvim-lspconfig",
        },
        {
            -- Completion menu
            import = "plugins.nvim-cmp",
        },
        {
            -- Snippets
            import = "plugins.luasnip",
        },
        {
            -- Formatter
            import = "plugins.conform",
        },
        {
            -- TREE
            import = "plugins.neo-tree",
        },
        {
            -- Telescope
            import = "plugins.telescope",
        },
        {
            -- Actions preview
            import = "plugins.actions-preview",
        },
        {
            import = "plugins.dashboard-nvim",
        },
        {
            --     -- Which Key
            import = "plugins.which_key",
        },
        {
            -- Autopairs
            import = "plugins.nvim-autopairs",
        },
        {
            -- Git modification (on the left)
            import = "plugins.gitsigns"
        },
        {
            -- Move around
            import = "plugins.hop"
        },
        {
            -- Comments lines
            import = "plugins.comment"
        },
        {
            -- Todo Comments
            import = "plugins.todo-comments"
        },
        {
            -- Markdown preview
            import = "plugins.peek"
        },
        {
            -- Hlsearch Lens (better `n` and `N` search)
            import = "plugins.nvim-hlslens"
        },
    },
    ui = {
        border = "rounded",
    },
    -- Colorscheme that will be used when installing plugins.
    install = { colorscheme = { "nightfox" } },
})
