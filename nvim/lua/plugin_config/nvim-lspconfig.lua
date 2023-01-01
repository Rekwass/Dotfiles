return function()

    local lsp = require("lspconfig")

    local utils = require("utils")

    local map = utils.map

    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    map("n", "<leader>of", ":lua vim.diagnostic.open_float()<CR>")
    map("n", "[d", ":lua vim.diagnostic.goto_prev()<CR>")
    map("n", "]d", ":lua vim.diagnostic.goto_next()<CR>")

    local on_attach = function(client, bufnr)
        local function buf_set_keymap(...) utils.buf_map(bufnr, ...) end

        vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

        if client.supports_method "textDocument/declaration" then
            buf_set_keymap("n", "gD", ":lua vim.lsp.buf.declaration()<CR>")
        end

        if client.supports_method "textDocument/definition" then
            buf_set_keymap("n", "gd", ":lua vim.lsp.buf.definition()<CR>")
        end

        if client.supports_method "textDocument/implementation" then
            buf_set_keymap("n", "gi", ":lua vim.lsp.buf.implementation()<CR>")
        end

        if client.supports_method "textDocument/references" then
            buf_set_keymap("n", "gr", ":lua vim.lsp.buf.references()<CR>")
        end

        if client.supports_method "textDocument/hover" then
            buf_set_keymap("n", "K", ":lua vim.lsp.buf.hover()<CR>")
        end

        if client.supports_method "textDocument/codeAction" then
            buf_set_keymap("n", "<leader>qf", ":lua vim.lsp.buf.code_action({apply = true})<CR>")
        end

        if client.supports_method "textDocument/rename" then
            buf_set_keymap("n", "<leader>rn", ":lua vim.lsp.buf.rename()<CR>")
        end

        if client.supports_method "textDocument/formatting" then
            vim.api.nvim_create_autocmd("BufWritePre", {
                desc = "Enable formatting on save",
                pattern = "*",
                group = vim.api.nvim_create_augroup("format_on_save", { clear = true }),
                command = "lua vim.lsp.buf.format()",
            })
        end
    end

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
        on_attach = on_attach,
        capabilities = capabilities,
        cmd = { "dotnet", "/Users/rekwass/.local/share/nvim/mason/packages/omnisharp/OmniSharp.dll" },
        enable_editorconfig_support = true,
        enable_ms_build_load_projects_on_demand = false,
        enable_roslyn_analyzers = false,
        organize_imports_on_format = false,
        enable_import_completion = false,
        sdk_include_prereleases = true,
        analyze_open_documents_only = false,
    }

    local servers = {
        { name = "clangd" },
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
