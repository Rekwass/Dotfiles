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
		config = require("plugin_config.nightfox"),
	},

	-- Portable package manager (LSP, DAP, Linters, ...)
	{
		"williamboman/mason.nvim",
		config = require("plugin_config.mason"),
	},
	"williamboman/mason-lspconfig.nvim",
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		config = require("plugin_config.mason-tool-installer"),
	},

	-- Enhanced colors and highlighting
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = require("plugin_config.nvim-treesitter"),
	},

	-- Highlight hovered word
	{
		"RRethy/vim-illuminate",
		config = require("plugin_config.vim-illuminate"),
	},

	-- Buffers on top of the screen
	{
		"akinsho/bufferline.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = require("plugin_config.bufferline"),
	},

	-- Line on the bottom of the screen
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = require("plugin_config.lualine"),
	},

	-- Line on the bottom of the screen
	{
		"petertriho/nvim-scrollbar",
		config = require("plugin_config.nvim-scrollbar"),
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
		config = require("plugin_config.nvim-lspconfig"),
	},

	-- Code action menu
	{
		"weilbith/nvim-code-action-menu",
		cmd = "CodeActionMenu",
		config = require("plugin_config.neovim-code-action-menu"),
	},

	-- Snippets
	{
		"L3MON4D3/LuaSnip",
		config = require("plugin_config.luasnip"),
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
		config = require("plugin_config.nvim-cmp"),
	},
	"saadparwaiz1/cmp_luasnip",
	{
		"tzachar/cmp-tabnine",
		build = "./install.sh",
		dependencies = "hrsh7th/nvim-cmp",
		config = require("plugin_config.cmp-tabnine"),
	},

	-- Greeter
	{
		"goolord/alpha-nvim",
		lazy = false,
		priority = 100,
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = require("plugin_config.alpha"),
	},

	-- Which Key
	{
		"folke/which-key.nvim",
		config = require("plugin_config.which_key"),
	},

	-- Autopairs
	{
		"windwp/nvim-autopairs",
		config = require("plugin_config.nvim-autopairs"),
	},

	-- Diagnostics menu
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = require("plugin_config.trouble"),
	},

	-- Nvim notifications
	-- {
	--     "rcarriga/nvim-notify",
	--     config = require("plugin_config.nvim-notify"),
	-- },

	-- Git modification (on the left)
	{
		"lewis6991/gitsigns.nvim",
		config = require("plugin_config.gitsigns"),
	},

	-- Navigation
	{
		"phaazon/hop.nvim",
		config = require("plugin_config.hop"),
	},

	-- Comments lines
	{
		"numToStr/Comment.nvim",
		config = require("plugin_config.comment")
	},

	-- Highlight trailing whitespace
	{
		"ntpeters/vim-better-whitespace",
		config = require("plugin_config.vim-better-whitespace"),
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
		config = require("plugin_config.telescope"),
	},

	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = require("plugin_config.nvim-tree"),
	},

	-- Todo Comments
	{
		"folke/todo-comments.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		config = require("plugin_config.todo-comments"),
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
		init = require("plugin_config.markdown-preview"),
		ft = { "markdown" },
	},

}, {
	install = {
		colorscheme = { "nightfox" },
	},
}
)
