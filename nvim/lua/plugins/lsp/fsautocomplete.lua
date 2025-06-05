local util = require 'lspconfig.util'

local M = {}

M.configuration = {
    cmd = { 'fsautocomplete', '--adaptive-lsp-server-enabled' },
    root_dir = function(bufnr, on_dir)
        local fname = vim.api.nvim_buf_get_name(bufnr)
        on_dir(util.root_pattern('*.sln', '*.fsproj', '.git')(fname))
    end,
    filetypes = { 'fsharp' },
    init_options = {
        AutomaticWorkspaceInit = true,
    },
    -- this recommended settings values taken from  https://github.com/ionide/FsAutoComplete?tab=readme-ov-file#settings
    settings = {
        FSharp = {
            keywordsAutocomplete = true,
            ExternalAutocomplete = false,
            Linter = true,
            UnionCaseStubGeneration = true,
            UnionCaseStubGenerationBody = 'failwith "Not Implemented"',
            RecordStubGeneration = true,
            RecordStubGenerationBody = 'failwith "Not Implemented"',
            InterfaceStubGeneration = true,
            InterfaceStubGenerationObjectIdentifier = 'this',
            InterfaceStubGenerationMethodBody = 'failwith "Not Implemented"',
            UnusedOpensAnalyzer = true,
            UnusedDeclarationsAnalyzer = true,
            UseSdkScripts = true,
            SimplifyNameAnalyzer = true,
            ResolveNamespaces = true,
            EnableReferenceCodeLens = true,
        },
    },
}

return M
