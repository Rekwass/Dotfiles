local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup(function(use)

  --- Package manager
  use { 'wbthomason/packer.nvim' }

  -- Color theme
  use {
    'navarasu/onedark.nvim',
    config = require('plugin_config.onedark'),
  }

  -- Enhanced highlighting
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = require('plugin_config.nvim-treesitter'),
  }

  -- Highlight occurences of hovered word
  use { 'RRethy/vim-illuminate' }

  -- Buffers on top of the screen
  use {
    'akinsho/bufferline.nvim',
    tag = "v2.*",
    requires = 'kyazdani42/nvim-web-devicons',
    config = require('plugin_config.bufferline'),
  }

  -- Line on the bottom of the screen
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = require('plugin_config.lualine'),
  }

  -- LSP
  use {
    'neovim/nvim-lspconfig',
    requires = {
      {
        'RishabhRD/nvim-lsputils',
        requires = { 'RishabhRD/popfix' },
      },
    },
    config = require('plugin_config.nvim-lspconfig'),
  }

  -- Display progress of LSP
  use {
    'j-hui/fidget.nvim',
    config = require('plugin_config.fidget'),
  }

  -- Code action menu
  use {
    'weilbith/nvim-code-action-menu',
    cmd = 'CodeActionMenu',
    config = require('plugin_config.neovim-code-action-menu'),
  }

  -- Snippets
  use {
    'L3MON4D3/LuaSnip',
    config = require('plugin_config.luasnip'),
  }

  -- Completion menu
  use {
    'hrsh7th/nvim-cmp',
    requires = {
        'hrsh7th/cmp-nvim-lsp',
      },
    config = require('plugin_config.nvim-cmp'),
  }
  use { 'saadparwaiz1/cmp_luasnip' }

  -- Diagnostics menu
  use {
    'folke/trouble.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = require('plugin_config.trouble'),
  }

  -- Comments
  use {
    'terrortylor/nvim-comment',
    config = require('plugin_config.nvim-comment'),
  }

  -- Highlight trailing whitespace
  use {
    'ntpeters/vim-better-whitespace',
    config = require('plugin_config.vim-better-whitespace'),
  }

  -- Live share
  use { 'jbyuki/instant.nvim' }

  -- Search utilities
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      {'nvim-lua/plenary.nvim'},
      {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}
    },
    config = require('plugin_config.telescope'),
  }

  -- Python code formatter
  use {
    'psf/black',
    config = require('plugin_config.black'),
  }

  -- Marckdown preview
  use {
    'iamcco/markdown-preview.nvim',
    run = "cd app && npm install",
    setup = require('plugin_config.markdown-preview'),
    ft = { "markdown" },
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
