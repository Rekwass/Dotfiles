return function ()

  local lspconfig = require('lspconfig')

  --local utils = require('utils')

  --local map = require("utils").map

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

  --capabilities.textDocument.completion.completionItem.snippetSupport = true

  local opts = { noremap=true, silent=true }
  vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
  vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
  --[[
  map('n', '<leader>e', ':lua vim.diagnostic.open_float<CR>', opts)
  map('n', '[d', ':lua vim.diagnostic.goto_prev<CR>', opts)
  map('n', ']d', ':lua vim.diagnostic.goto_next<CR>', opts)
  map('n', '<space>q', ':lua vim.diagnostic.setloclist<CR>', opts)
  ]]--

  --[[
  local on_attach = function(ls_on_attach)
    return function(client, bufnr)
      local function buf_set_keymap(...) utils.buf_map(bufnr, ...) end
        buf_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.declaration()<CR>')
        buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
        buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
        buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
        buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
        buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
        buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>')
        buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>')
        vim.keymap.set('n', '<space>wl', function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, bufopts)
        buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
        buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
        buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>')
        buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
        buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>')

      --if client.resolved_capabilities.document_formatting then
        --buf_set_keymap('n', '<leader>F',         '<cmd>lua vim.lsp.buf.formatting()<CR>')
        --buf_set_keymap('n', '<leader><leader>F', '<cmd>lua require(\'lsp\').toggle_format_on_save()<CR>')
        --require('lsp').set_format_on_save(true)
      --end

      --require('illuminate').on_attach(client)
    end
  end
  ]]--

  local servers = {
    { name = 'clangd' },
    { name = 'pyright' },
    { name = 'rust_analyzer' },
    }

  for _, server in ipairs(servers) do
    lspconfig[server.name].setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end

  --[[
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
  ]]--

end
