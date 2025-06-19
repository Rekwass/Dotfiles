return
{
    lazy = false,
    "catppuccin/nvim",
    name = "catpuccin",
    priority = 1000,
    config = function()
        vim.cmd("colorscheme catppuccin-latte")
    end,
}
