return {
    'numToStr/Comment.nvim',
    opts = {
        ignore = '^$',
        toggler = {
            line = '<leader>c<space>',
            block = '<leader>bc',
        },
        opleader = {
            line = '<leader>c',
            block = '<leader>b',
        },
        mappings = {
            ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
            basic = true,
            ---Extra mapping; `gco`, `gcO`, `gcA`
            extra = false,
        },
    },
}
