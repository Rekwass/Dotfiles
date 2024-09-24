vim.opt.termguicolors = true -- Enable 24-bit colours
vim.opt.cursorline = true    -- Highlight current line


vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()" -- This seems to be the prefered method over the next line
-- vim.wo.foldexpr = "nvim_treesitter#foldexpr()" -- If anything breaks, use zx

vim.opt.foldenable = false -- Unfold everything in a file by default
vim.opt.foldlevel = 99 --  Sets default folding level to 99

vim.opt.number = true -- Display line numbers
vim.opt.relativenumber = true -- Print offset from highlighted line
vim.opt.scrolloff = 100 -- Make the cursor see x lines above cursor
vim.opt.showbreak = "↪" -- Show line wrapping character
vim.opt.pumheight = 15 -- Maximum number of items to show in the popup menu
vim.opt.ignorecase = true -- Ignore the case when searching
vim.opt.smartcase = true -- Use smartcase when searching

vim.opt.shiftwidth = 4 -- Number of spaces for auto-indent
vim.opt.tabstop = 4 -- Number of spaces per tab
vim.opt.expandtab = true -- Insert spaces instead of tabs
vim.opt.smartindent = true -- Automatically indents on patterns (e.g.: {, })
vim.opt.mouse = "" -- Disables mouse because why would you need your mouse when using nvim ?

vim.opt.backup = true -- Enables backups
vim.opt.undofile = true -- Enable persistent undo
vim.opt.backupdir = { "~/.nvim-backup-files", "/tmp/nvim-backup-files" } -- Specify backups directories
vim.opt.undodir = "/tmp/nvim-undo-history" -- Specify undo directory

vim.opt.updatetime = 250 -- Update time in milliseconds before writing in a swap file /!\ Time before diagnositc is displayed

vim.opt.confirm = true -- Prompts when attempting to leave file with changes left to save instead of an error

require("config.lazy")

require("keybindings.base")
