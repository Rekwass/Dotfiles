local M = {}

local utils = require("utils")

M.configuration = {
    on_attach = function(_, bufnr)
        local function buf_set_keymap(...) utils.buf_map(bufnr, ...) end

        -- replaces vim.lsp.buf.definition()
        buf_set_keymap("n", "gd", "<Cmd>lua require('omnisharp_extended').lsp_definition()<CR>")
        -- replaces vim.lsp.buf.type_definition()
        buf_set_keymap("n", "gt", "<Cmd>lua require('omnisharp_extended').lsp_type_definition()<CR>")
        -- replaces vim.lsp.buf.implementation()
        buf_set_keymap("n", "gi", "<Cmd>lua require('omnisharp_extended').lsp_implementation()<CR>")
        -- replaces vim.lsp.buf.references()
        buf_set_keymap("n", "gr", "<Cmd>lua require('omnisharp_extended').lsp_references()<CR>")
    end,
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
    cmd = { "dotnet", require("mason-registry").get_package("omnisharp").get_install_path("omnisharp") .. "/omnisharp/libexec/OmniSharp.dll" },
    settings = {
        FormattingOptions = {
            -- Enables support for reading code style, naming convention and analyzer
            -- settings from .editorconfig.
            EnableEditorConfigSupport = true,
            -- Specifies whether 'using' directives should be grouped and sorted during
            -- document formatting.
            OrganizeImports = true,
        },
        MsBuild = {
            -- If true, MSBuild project system will only load projects for files that
            -- were opened in the editor. This setting is useful for big C# codebases
            -- and allows for faster initialization of code navigation features only
            -- for projects that are relevant to code that is being edited. With this
            -- setting enabled OmniSharp may load fewer projects and may thus display
            -- incomplete reference lists for symbols.
            LoadProjectsOnDemand = nil,
        },
        RoslynExtensionsOptions = {
            -- Enables support for roslyn analyzers, code fixes and rulesets.
            EnableAnalyzersSupport = nil,
            -- Enables support for showing unimported types and unimported extension
            -- methods in completion lists. When committed, the appropriate using
            -- directive will be added at the top of the current file. This option can
            -- have a negative impact on initial completion responsiveness,
            -- particularly for the first few completion sessions after opening a
            -- solution.
            EnableImportCompletion = true,
            -- Only run analyzers against open files when 'enableRoslynAnalyzers' is
            -- true
            AnalyzeOpenDocumentsOnly = nil,
        },
        Sdk = {
            -- Specifies whether to include preview versions of the .NET SDK when
            -- determining which version to use for project loading.
            IncludePrereleases = true,
        },
    },
}

return M
