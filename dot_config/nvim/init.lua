vim.opt.termguicolors = true -- Enable 24-bit colours
vim.opt.cursorline = true -- Highlight current line

vim.opt.foldmethod = "expr" -- Expression based folding (nerdsitter)
vim.opt.foldexpr = "nvim_treesitter#foldexpr()" -- If anything breaks, use zx
vim.opt.foldenable = false -- Unfold everything in a file by default
vim.opt.foldlevel = 99 --  Sets default folding level to 99

vim.opt.number = true -- Display line numbers
vim.opt.relativenumber = true -- Print offset from highlighted line
vim.opt.scrolloff = 1 -- Make the cursor see x lines above cursor
vim.showbreak = "↪" -- Show line wrapping character
vim.opt.pumheight = 15 -- Maximum number of items to show in the popup menu

vim.opt.smartcase = true -- Use smartcase when searching

vim.opt.shiftwidth = 4 -- Number of spaces for auto-indent
vim.opt.tabstop = 4 -- Number of spaces per tab
vim.expandtab = true -- Insert spaces instead of tabs
vim.opt.smartindent = true -- Automatically indents on patterns (e.g.: {, })
vim.opt.mouse = "" -- Disables mouse because why would you need your mouse when using nvim ?
vim.opt.ignorecase = true

require("lua.config")
