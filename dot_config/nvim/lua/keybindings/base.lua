local map = require("utils").map

-- Copy to clipboard
map("n", "<leader>y", "\"+yy")
map("v", "<leader>y", "\"+y")

-- Paste from clipboard
map("n", "<leader>p", "\"+p")
map("v", "<leader>p", "\"+p")

-- Buffer manipulation
map("n", "<leader>T", "<Cmd>enew<CR>")
map("n", "<leader>bq", "<Cmd>bp <BAR> bd #<CR>")
map("n", "<leader>baq", "<Cmd>bufdo bd<CR>")

-- Remove search highlight with //
map("n", "//", "<Cmd>nohlsearch<CR>")

-- Switch to alternate file.
map("n", "<leader><leader>", "<C-^>")

-- Splits
map("n", "ss", "<Cmd>split<CR><C-W>j")
map("n", "vv", "<Cmd>vsplit<CR><C-W>l")

-- Exit insert mode
map("i", "kj", "<ESC>")
map("i", "jk", "<ESC>")
map("i", "Kj", "<ESC>")
map("i", "Jk", "<ESC>")
map("i", "kJ", "<ESC>")
map("i", "jK", "<ESC>")
map("i", "KJ", "<ESC>")
map("i", "JK", "<ESC>")

-- Exit terminal mode
map("t", "kj", "<C-\\><C-n>")
map("t", "jk", "<C-\\><C-n>")
map("t", "Kj", "<C-\\><C-n>")
map("t", "Jk", "<C-\\><C-n>")
map("t", "kJ", "<C-\\><C-n>")
map("t", "jK", "<C-\\><C-n>")
map("t", "KJ", "<C-\\><C-n>")
map("t", "JK", "<C-\\><C-n>")

-- Make navigation easier
map("n", "<C-j>", "<C-w>j")
map("n", "<C-h>", "<C-w>h")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Folds
map("n", "<Space>", "za")

-- Replace selection
map("v", "<C-r>", "\"hy:%s/<C-r>h//gc<left><left><left>")

-- Delete to the void register
map("n", "<leader>d", "\"_d")
map("v", "<leader>d", "\"_d")

-- Paste over selection and don't copy
map("x", "<leader>P", "\"_dP")

-- CodeActionMenu
-- map("n", "<leader>ac", "<Cmd>CodeActionMenu<CR>")

vim.api.nvim_create_user_command("W", "w", {})
vim.api.nvim_create_user_command("WQ", "wq", {})

vim.api.nvim_set_keymap("ca", "h", "vertical help", {})

-- vim.keymap.set("ca", "h", "vertical help")

-- map("n", "<Up><Up><Down><Down><Left><Right><Left><Right>ba<space>", ":x<ENTER>")
