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
  use 'wbthomason/packer.nvim'

  -- Color theme  
  use {
    'navarasu/onedark.nvim',
    config = require('plugin_config.onedark')
  }

  -- Enhanced highlighting
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = require('plugin_config.nvim-treesitter')
  }

  -- Search utilities
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      {'nvim-lua/plenary.nvim'},
      {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}
    },
    config = require('plugin_config.telescope')
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
