local M = {}

-- Recommended capabilities on the [documentation](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#jsonls)
local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem.snippetSupport = true

M.configuration = {
    cmd = { 'vscode-json-language-server', '--stdio' },
    filetypes = { 'json', 'jsonc' },
    init_options = {
        provideFormatter = true,
    },
    capabilities = capabilities,
    root_markers = { '.git' },
}

return M
