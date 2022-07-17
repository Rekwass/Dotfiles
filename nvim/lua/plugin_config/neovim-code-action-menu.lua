return function ()

  local map = require("utils").map
  
  map('n', '<leader>ac', '<cmd>lua CodeActionMenu<CR>')

end
