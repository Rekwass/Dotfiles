return function()

    local lsp = require("lspconfig")

    local utils = require("utils")

    local map = utils.map

    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    map("n", "<leader>of", ":lua vim.diagnostic.open_float()<CR>")
    map("n", "[d", ":lua vim.diagnostic.goto_prev()<CR>")
    map("n", "]d", ":lua vim.diagnostic.goto_next()<CR>")

    local on_attach = function(_, bufnr)
        local function buf_set_keymap(...) utils.buf_map(bufnr, ...) end

        vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
        buf_set_keymap("n", "gD", ":lua vim.lsp.buf.declaration()<CR>")
        buf_set_keymap("n", "gd", ":lua vim.lsp.buf.definition()<CR>")
        buf_set_keymap("n", "gi", ":lua vim.lsp.buf.implementation()<CR>")
        buf_set_keymap("n", "gr", ":lua vim.lsp.buf.references()<CR>")
        buf_set_keymap("n", "K", ":lua vim.lsp.buf.hover()<CR>")
        buf_set_keymap("n", "<leader>qf", ":lua vim.lsp.buf.code_action({apply = true})<CR>")
        buf_set_keymap("n", "<leader>rn", ":lua vim.lsp.buf.rename()<CR>")

        vim.api.nvim_create_autocmd("BufWritePre", {
            desc = "Enable formatting on save",
            pattern = "*",
            group = vim.api.nvim_create_augroup("format_on_save", { clear = true }),
            command = "lua vim.lsp.buf.format()",
        })
    end

    vim.lsp.protocol.CompletionItemKind = {
        "   (Text) ",
        "   (Method)",
        "   (Function)",
        "   (Constructor)",
        " ﴲ  (Field)",
        "   (Variable)",
        "   (Class)",
        " ﰮ  (Interface)",
        "   (Module)",
        " 襁 (Property)",
        "   (Unit)",
        "   (Value)",
        " 練 (Enum)",
        "   (Keyword)",
        "   (Snippet)",
        "   (Color)",
        "   (File)",
        "   (Reference)",
        "   (Folder)",
        "   (EnumMember)",
        " ﲀ  (Constant)",
        " ﳤ  (Struct)",
        "   (Event)",
        "   (Operator)",
        "   (TypeParameter)"
    }

    capabilities.textDocument.completion.completionItem.snippetSupport = true

    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, {
        underline = true,
        update_in_insert = false,
        virtual_text = {
            prefix = ""
        },
    }
    )

    -- vim.lsp.handlers["textDocument/codeAction"] = require"lsputil.codeAction".code_action_handler

    vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
    vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
    vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
    vim.fn.sign_define("DiagnosticSignHint", { text = " ", texthl = "DiagnosticSignHint" })


    lsp["sumneko_lua"].setup {
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
            Lua = {
                diagnostics = {
                    globals = { 'vim' }
                }
            }
        }
    }

    lsp.omnisharp.setup {
        cmd = { "dotnet", "/Users/rekwass/.local/share/nvim/mason/packages/omnisharp/OmniSharp.dll" },

        -- Enables support for reading code style, naming convention and analyzer
        -- settings from .editorconfig.
        enable_editorconfig_support = true,

        -- If true, MSBuild project system will only load projects for files that
        -- were opened in the editor. This setting is useful for big C# codebases
        -- and allows for faster initialization of code navigation features only
        -- for projects that are relevant to code that is being edited. With this
        -- setting enabled OmniSharp may load fewer projects and may thus display
        -- incomplete reference lists for symbols.
        enable_ms_build_load_projects_on_demand = false,

        -- Enables support for roslyn analyzers, code fixes and rulesets.
        enable_roslyn_analyzers = false,

        -- Specifies whether 'using' directives should be grouped and sorted during
        -- document formatting.
        organize_imports_on_format = false,

        -- Enables support for showing unimported types and unimported extension
        -- methods in completion lists. When committed, the appropriate using
        -- directive will be added at the top of the current file. This option can
        -- have a negative impact on initial completion responsiveness,
        -- particularly for the first few completion sessions after opening a
        -- solution.
        enable_import_completion = false,

        -- Specifies whether to include preview versions of the .NET SDK when
        -- determining which version to use for project loading.
        sdk_include_prereleases = true,

        -- Only run analyzers against open files when 'enableRoslynAnalyzers' is
        -- true
        analyze_open_documents_only = false,
    }

    local servers = {
        { name = "clangd" },
        -- { name = "csharp_ls" },
        { name = "pyright" },
        { name = "rust_analyzer" },
        { name = "yamlls" },
        { name = "cmake" },
        { name = "bashls" },
        { name = "hls" },
        { name = "vimls" },
    }

    for _, server in ipairs(servers) do
        lsp[server.name].setup {
            on_attach = on_attach,
            capabilities = capabilities,
        }
    end

end
