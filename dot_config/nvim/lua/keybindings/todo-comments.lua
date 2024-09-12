local map = require("utils").map

map("n", "[t", "<Cmd>lua require(\"todo-comments\").jump_prev()<CR>")
map("n", "]t", "<Cmd>lua require(\"todo-comments\").jump_next()<CR>")
