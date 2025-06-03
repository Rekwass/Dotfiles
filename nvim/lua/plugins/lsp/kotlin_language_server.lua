local M = {}

M.configuration = {
    cmd = { vim.uv.os_uname().version:match("Windows") and 'kotlin-language-server.cmd' or 'kotlin-language-server' },
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
}

return M
