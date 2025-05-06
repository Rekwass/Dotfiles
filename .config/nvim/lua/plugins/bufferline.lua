return {
    "akinsho/bufferline.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "neovim/nvim-lspconfig"
    },
    keys = {
        { "<leader>j", "<Cmd>BufferLineCyclePrev<CR>", desc = "Cycle to the previous buffer" },
        { "<leader>l", "<Cmd>BufferLineCycleNext<CR>", desc = "Cycle to the next buffer" },
        { "<leader>h", "<Cmd>BufferLineMovePrev<CR>",  desc = "Move buffer to the left" },
        { "<leader>k", "<Cmd>BufferLineMoveNext<CR>",  desc = "Move buffer to the right" },
    },
    opts = {
        options = {
            diagnostics = "nvim_lsp",
            diagnostics_indicator = function(_, _, diagnostics_dict, _)
                local s = " "
                for e, n in pairs(diagnostics_dict) do
                    local sym = e == "error" and " "
                        or (e == "warning" and " " or " ")
                    s = s .. n .. sym
                end
                return s
            end
        }
    },
    lazy = false,
}
