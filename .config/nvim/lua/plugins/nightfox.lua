return
{
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
    opts = {
        options = {
            styles = {
                comments = "italic",
                constants = "bold",
                keywords = "bold",
            },
        }
    },
    config = function()
        vim.cmd("colorscheme nightfox")
    end,
}
