return function()
    local map = require("utils").map

    require("hop").setup()

    map("n", "<leader>J", "<Cmd>HopWord<CR>")
end
