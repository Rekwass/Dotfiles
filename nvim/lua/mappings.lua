local map = require("utils").map

vim.g.mapleader = ","

-- Copy to clipboard
map("n", "<leader>y", "\"+yy")
map("v", "<leader>y", "\"+y")

-- Paste from clipboard
map("n", "<leader>p", "\"+p")
map("v", "<leader>p", "\"+p")

-- Buffer manipulation
map("n", "<leader>T", ":enew<CR>")
map("n", "<leader>bq", ":bp <BAR> bd #<CR>")

-- Change buffer width
map("n", "<leader>+", ":vertical resize +1<CR>")
map("n", "<leader>-", ":vertical resize -1<CR>")

-- Remove search highlight with //
map("n", "//", ":nohlsearch<CR>")

-- Switch to alternate file.
map("n", "<leader><leader>", "<C-^>")

-- Splits
map("n", "ss", ":split<CR><C-W>j")
map("n", "vv", ":vsplit<CR><C-W>l")

-- Exit insert mode
map("i", "kj", "<ESC>")
map("i", "jk", "<ESC>")
map("i", "Kj", "<ESC>")
map("i", "Jk", "<ESC>")
map("i", "kJ", "<ESC>")
map("i", "jK", "<ESC>")
map("i", "KJ", "<ESC>")
map("i", "JK", "<ESC>")

-- Make navigation easier
map("n", "<C-j>", "<C-w>j")
map("n", "<C-h>", "<C-w>h")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Folds
map("n", "<Space>", "za")

-- Replace selection
map("v", "<C-r>", "\"hy:%s/<C-r>h//gc<left><left><left>")

-- CodeActionMenu
map("n", "<leader>ac", ":CodeActionMenu<CR>")

vim.api.nvim_create_user_command("W", "w", {})

map("n", "<Up><Up><Down><Down><Left><Right><Left><Right>ba<space>", ":x<ENTER>")
