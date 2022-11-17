return function()

    require("Comment").setup({
        ---Add a space b/w comment and the line
        padding = true,
        ---Whether the cursor should stay at its position
        sticky = true,
        ---Lines to be ignored while (un)comment
        ignore = nil,
        ---LHS of operator-pending mappings in NORMAL and VISUAL mode
        opleader = {
            line = "<leader>c<space>",
        },
    })

end
