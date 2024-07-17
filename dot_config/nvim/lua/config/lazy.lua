local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ","

require("lazy").setup({
	-- Color theme
	{
		"EdenEast/nightfox.nvim",
		lazy = false,
		priority = 1000,
		config = require("plugins.nightfox"),
	},

	-- Portable package manager (LSP, DAP, Linters, ...)
	{
		"williamboman/mason.nvim",
		config = require("plugins.mason"),
	},
	"williamboman/mason-lspconfig.nvim",
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		config = require("plugins.mason-tool-installer"),
	},

	-- Enhanced colors and highlighting
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = require("plugins.nvim-treesitter"),
	},

	-- Highlight hovered word
	{
		"RRethy/vim-illuminate",
		config = require("plugins.vim-illuminate"),
	},

	-- Buffers on top of the screen
	{
		"akinsho/bufferline.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = require("plugins.bufferline"),
	},

	-- Line on the bottom of the screen
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = require("plugins.lualine"),
	},

	-- Line on the bottom of the screen
	{
		"petertriho/nvim-scrollbar",
		config = require("plugins.nvim-scrollbar"),
	},

	-- LSP
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"RishabhRD/popfix",
				"RishabhRD/nvim-lsputils",
			},
		},
		config = require("plugins.nvim-lspconfig"),
	},

	-- Code action menu
	{
		"weilbith/nvim-code-action-menu",
		cmd = "CodeActionMenu",
		config = require("plugins.neovim-code-action-menu"),
	},

	-- Snippets
	{
		"L3MON4D3/LuaSnip",
		config = require("plugins.luasnip"),
	},

	-- Completion menu
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
		},
		config = require("plugins.nvim-cmp"),
	},
	"saadparwaiz1/cmp_luasnip",

	-- Greeter
	{
		"goolord/alpha-nvim",
		lazy = false,
		priority = 100,
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = require("plugins.alpha"),
	},

	-- Which Key
	{
		"folke/which-key.nvim",
		config = require("plugins.which_key"),
	},

	-- Autopairs
	{
		"windwp/nvim-autopairs",
		config = require("plugins.nvim-autopairs"),
	},

	-- Diagnostics menu
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = require("plugins.trouble"),
	},

	-- Nvim notifications
	-- {
	--     "rcarriga/nvim-notify",
	--     config = require("plugins.nvim-notify"),
	-- },

	-- Git modification (on the left)
	{
		"lewis6991/gitsigns.nvim",
		config = require("plugins.gitsigns"),
	},

	-- Navigation
	{
		"phaazon/hop.nvim",
		config = require("plugins.hop"),
	},

	-- Comments lines
	{
		"numToStr/Comment.nvim",
		config = require("plugins.comment")
	},

	-- Highlight trailing whitespace
	{
		"ntpeters/vim-better-whitespace",
		config = require("plugins.vim-better-whitespace"),
	},

	-- Search utilities
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build =
				"cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
			},
		},
		config = require("plugins.telescope"),
	},

	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = require("plugins.nvim-tree"),
	},

	-- Todo Comments
	{
		"folke/todo-comments.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		config = require("plugins.todo-comments"),
	},

	-- Python code formatter
	{
		"psf/black",
		ft = { "python" },
	},

	-- Markdown preview
	{
		"iamcco/markdown-preview.nvim",
		build = "cd app && npm install",
		init = require("plugins.markdown-preview"),
		ft = { "markdown" },
	},

}, {
	install = {
		colorscheme = { "nightfox" },
	},
}
)
