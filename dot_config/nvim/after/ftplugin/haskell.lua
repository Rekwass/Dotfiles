local ht = require('haskell-tools')
local bufnr = vim.api.nvim_get_current_buf()
local opts = { noremap = true, silent = true, buffer = bufnr, }
-- Hoogle search for the type signature of the definition under the cursor
-- vim.keymap.set('n', '<leader>hs', ht.hoogle.hoogle_signature, opts)
-- Toggle a GHCi repl for the current package
-- vim.keymap.set('n', '<leader>rr', ht.repl.toggle, opts)

-- Evaluate all code snippets
vim.keymap.set('n', '<leader>ea', ht.lsp.buf_eval_all, opts)

-- Toggle a GHCi repl for the current buffer
vim.keymap.set('n', '<leader>rf', function()
    ht.repl.toggle(vim.api.nvim_buf_get_name(0))
end, opts)

-- Closes GHCi repl
vim.keymap.set('n', '<leader>rq', ht.repl.quit, opts)