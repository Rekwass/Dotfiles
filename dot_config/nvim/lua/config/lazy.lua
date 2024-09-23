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
    spec = { { import = "plugins" } },
    ui = {
        border = "rounded",
    },
    -- Colorscheme that will be used when installing plugins.
    install = { colorscheme = { "nightfox" } },
})
