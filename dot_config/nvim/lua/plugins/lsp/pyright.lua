local M = {}

M.configuration = {
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
}

--[[lsp["pyright"].setup {
  on_attach = on_attach,
  capabilities = capabilities,
  vim.api.nvim_create_autocmd("FileType", {
    desc = "Format python on write using black",
    pattern = "python",
    group = vim.api.nvim_create_augroup("black_on_save", { clear = true }),
    callback = function(opts)
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = opts.buf,
        group = vim.api.nvim_create_augroup("format_on_save", { clear = true }),
        command = "Black",
      })
    end,
  })
}]]

return M
