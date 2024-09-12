return {
    "aznhe21/actions-preview.nvim",
    dependencies = {
        "neovim/nvim-lspconfig",
        'nvim-telescope/telescope.nvim',
    },
    keys = {
        { "<leader>ca", "<Cmd>lua require(\"actions-preview\").code_actions()<CR>", desc = "Open the actions preview popup" },
    },
    config = function()
        local actionsPreview = require("actions-preview")

        actionsPreview.setup({
            telescope = {
                sorting_strategy = "ascending",
                layout_strategy = "vertical",
                layout_config = {
                    width = 0.8,
                    height = 0.9,
                    prompt_position = "top",
                    preview_cutoff = 20,
                    preview_height = function(_, _, max_lines)
                        return max_lines - 15
                    end,
                },
            },
        })
    end,
}
