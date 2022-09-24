return function ()

  local lsp = require("lspconfig")

  local utils = require("utils")

  local map = utils.map

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

  map("n", "<leader>of", ":lua vim.diagnostic.open_float()<CR>")
  map("n", "[d", ":lua vim.diagnostic.goto_prev()<CR>")
  map("n", "]d", ":lua vim.diagnostic.goto_next()<CR>")

  local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) utils.buf_map(bufnr, ...) end
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
    buf_set_keymap("n", "gD", ":lua vim.lsp.buf.declaration()<CR>")
    buf_set_keymap("n", "gd", ":lua vim.lsp.buf.definition()<CR>")
    buf_set_keymap("n", "gi", ":lua vim.lsp.buf.implementation()<CR>")
    buf_set_keymap("n", "gr", ":lua vim.lsp.buf.references()<CR>")
    buf_set_keymap("n", "K", ":lua vim.lsp.buf.hover()<CR>")
    buf_set_keymap("n", "<leader>rn", ":lua vim.lsp.buf.rename()<CR>")
    -- buf_set_keymap("n", "<space>D", ":lua vim.lsp.buf.type_definition()<CR>")
  end

  local servers = {
    { name = "clangd" },
    { name = "pyright" },
    { name = "rust_analyzer" },
    { name = "hls" },
    { name = "yamlls"},
    { name = "cmake"}
  }

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
  vim.fn.sign_define("DiagnosticSignWarn",  { text = " ", texthl = "DiagnosticSignWarn" })
  vim.fn.sign_define("DiagnosticSignInfo",  { text = " ", texthl = "DiagnosticSignInfo" })
  vim.fn.sign_define("DiagnosticSignHint",  { text = " ", texthl = "DiagnosticSignHint" })

  for _, server in ipairs(servers) do
    lsp[server.name].setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end

  vim.api.nvim_create_autocmd("BufWritePre", {
    desc = "Enable formatting on save",
    pattern = "*",
    command = "lua vim.lsp.buf.formatting_sync()",
  })

end
