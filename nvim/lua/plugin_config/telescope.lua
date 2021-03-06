return function ()

  local map = require("utils").map

  local telescope = require('telescope')

  local actions = require('telescope.actions')

  require("telescope").setup{
    defaults = {
      mappings = {
        i = {
          ["<Esc>"] = actions.close
        },
      },
    }
  }

  telescope.load_extension('fzf')

  map('n', '<leader>ff', ':lua require(\'telescope.builtin\').find_files()<CR>')
  map('n', '<leader>fg', ':lua require(\'telescope.builtin\').live_grep()<CR>')
  map('n', '<leader>fb', ':lua require(\'telescope.builtin\').buffers()<CR>')
  map('n', '<leader>fh', ':lua require(\'telescope.builtin\').help_tags()<CR>')

end
