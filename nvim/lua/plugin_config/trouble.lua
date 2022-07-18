return function ()

  local map = require('utils').map

  require('trouble').setup {
    mode = 'document_diagnostics',
    use_diagnostic_signs = false,
  }

  map('n', '<leader>x', ':TroubleToggle<CR>')
  map('n', '<leader>X', ':TroubleToggle workspace_diagnostics<CR>')

end
