local M = {}

M.configuration = {
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
    on_attach = function(_, bufnr)
        vim.api.nvim_create_autocmd("BufWritePre", {
            desc = "Fix every lint error before saving",
            buffer = bufnr,
            command = "EslintFixAll",
        })
    end,
}

return M
