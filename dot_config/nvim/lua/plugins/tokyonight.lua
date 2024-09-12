return
{
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
        style = "day",
        styles = {
            -- Style to be applied to different syntax groups
            -- Value is any valid attr-list value for `:help nvim_set_hl`
            comments = { italic = true },
            keywords = { bold = true },
            functions = {},
            variables = {},
        },
        day_brightness = 0.5, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
        dim_inactive = true
    },
    config = function()
        vim.cmd [[colorscheme tokyonight-day]]
    end,
}
