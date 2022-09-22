return function ()

  local map = require("utils").map

  require("luasnip.loaders.from_lua").load({paths = "./snippets"})

  map("i", "<C-n>", "<Plug>luasnip-next-choice")
  map("s", "<C-n>", "<Plug>luasnip-next-choice")
  map("i", "<C-p>", "<Plug>luasnip-prev-choice")
  map("i", "<C-p>", "<Plug>luasnip-prev-choice")

end
