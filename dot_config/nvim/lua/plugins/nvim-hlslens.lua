return
{
    "kevinhwang91/nvim-hlslens",
    keys = {
        { "n",  "<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>", desc = "Go to next search" },
        { "N",  "<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>", desc = "Go to previous search" },
        { "*",  "*<Cmd>lua require('hlslens').start()<CR>",                                             desc = "Highlight word under cursor and go to next search" },
        { "#",  "#<Cmd>lua require('hlslens').start()<CR>",                                             desc = "Highlight word under cursor and go to previous search" },
        { "g*", "g*<Cmd>lua require('hlslens').start()<CR>",                                            desc = "Highlight word under cursor and go to next search" },
        { "g#", "g#<Cmd>lua require('hlslens').start()<CR>",                                            desc = "Highlight word under cursor and go to previous search" },
    },
}
