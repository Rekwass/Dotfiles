local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    ---@diagnostic disable-next-line: lowercase-global
    packer_bootstrap = fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim",
        install_path })
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require("packer").startup(function(use)

    -- Package manager
    use { "wbthomason/packer.nvim" }

    -- Color theme
    use {
        "EdenEast/nightfox.nvim",
        config = require("plugin_config.nightfox"),
    }

    -- Portable package manager (LSP, DAP, Linters, ...)
    use {
        "williamboman/mason.nvim",
        config = require("plugin_config.mason"),
    }
    use { "williamboman/mason-lspconfig.nvim" }

    -- Enhanced colors and highlighting
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = require("plugin_config.nvim-treesitter"),
    }

    -- Buffers on top of the screen
    use {
        "akinsho/bufferline.nvim",
        tag = "v2.*",
        requires = { "kyazdani42/nvim-web-devicons" },
        config = require("plugin_config.bufferline"),
    }

    -- Line on the bottom of the screen
    use {
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
        config = require("plugin_config.lualine"),
    }

    -- LSP
    use {
        "neovim/nvim-lspconfig",
        requires = {
            {
                "RishabhRD/nvim-lsputils",
                requires = { "RishabhRD/popfix" },
            },
        },
        config = require("plugin_config.nvim-lspconfig"),
    }

    -- Code action menu
    use {
        "weilbith/nvim-code-action-menu",
        cmd = "CodeActionMenu",
        config = require("plugin_config.neovim-code-action-menu"),
    }

    -- Snippets
    use {
        "L3MON4D3/LuaSnip",
        config = require("plugin_config.luasnip"),
    }

    -- Completion menu
    use {
        "hrsh7th/nvim-cmp",
        requires = { "hrsh7th/cmp-nvim-lsp" },
        config = require("plugin_config.nvim-cmp"),
    }
    use { "saadparwaiz1/cmp_luasnip" }
    use {
        "tzachar/cmp-tabnine",
        run = "./install.sh",
        requires = "hrsh7th/nvim-cmp",
    }


    -- Adds a lot of UI elements (popup, etc)
    use {
        "folke/noice.nvim",
        event = "VimEnter",
        config = require("plugin_config.noice"),
        requires = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        }
    }

    -- Greeter
    use {
        "goolord/alpha-nvim",
        requires = { "kyazdani42/nvim-web-devicons" },
        config = require("plugin_config.alpha"),
    }

    -- Autopairs
    use {
        "windwp/nvim-autopairs",
        config = require("plugin_config.nvim-autopairs"),
    }

    -- Diagnostics menu
    use {
        "folke/trouble.nvim",
        requires = { "kyazdani42/nvim-web-devicons" },
        config = require("plugin_config.trouble"),
    }

    -- Git modification (on the left)
    use {
        "lewis6991/gitsigns.nvim",
        tag = "release",
        config = require("plugin_config.gitsigns"),
    }

    -- Navigation
    use {
        "phaazon/hop.nvim",
        branch = "v2",
        config = require("plugin_config.hop"),
    }

    -- Comments lines
    use {
        "numToStr/Comment.nvim",
        config = require("plugin_config.comment")
    }

    -- Highlight trailing whitespace
    use {
        "ntpeters/vim-better-whitespace",
        config = require("plugin_config.vim-better-whitespace"),
    }

    -- Live share
    use { "jbyuki/instant.nvim" }

    -- Search utilities
    use {
        "nvim-telescope/telescope.nvim",
        requires = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-telescope/telescope-fzf-native.nvim",
                run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build" },
        },
        config = require("plugin_config.telescope"),
    }

    -- Todo Comments
    use {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = require("plugin_config.todo-comments")
    }

    -- Python code formatter
    use {
        "psf/black",
        config = require("plugin_config.black"),
        ft = { "python" },
    }

    -- Marckdown preview
    use {
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        setup = require("plugin_config.markdown-preview"),
        ft = { "markdown" },
    }

    if packer_bootstrap then
        require("packer").sync()
    end
end)
