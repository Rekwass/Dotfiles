return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        "telescope-fzf-native.nvim",
    },
    keys = {
        { "<leader>ff", "<Cmd>lua require(\"telescope.builtin\").find_files()<CR>", desc = "Open Telescope with the find_files picker" },
        { "<leader>fg", "<Cmd>lua require(\"telescope.builtin\").live_grep()<CR>",  desc = "Open Telescope with the live_grep picker" },
    },
    config = function()
        local telescope = require("telescope");
        local actions = require("telescope.actions");

        -- Define a method for multi selection as it is not supported by default, see https://github.com/nvim-telescope/telescope.nvim/pull/807
        -- Thanks to jesseleite https://github.com/nvim-telescope/telescope.nvim/issues/1048#issuecomment-1679797700
        local select_one_or_multi = function(prompt_bufnr)
            local picker = require('telescope.actions.state').get_current_picker(prompt_bufnr)
            local multi = picker:get_multi_selection()
            if not vim.tbl_isempty(multi) then
                actions.close(prompt_bufnr)
                for _, j in pairs(multi) do
                    if j.path ~= nil then
                        vim.cmd(string.format('%s %s', 'edit', j.path))
                    end
                end
            else
                actions.select_default(prompt_bufnr)
            end
        end

        telescope.setup({
            defaults = {
                scroll_strategy = "limit",
                mappings = {
                    i = {
                        ["<Esc>"] = actions.close,
                        ["<CR>"] = select_one_or_multi,
                    },
                    n = {
                        ["<CR>"] = select_one_or_multi,
                    },
                },

            },
            pickers = {
                find_files = {
                    follow = true,
                    hidden = true,
                },
            },
        })

        telescope.load_extension("fzf")
    end
}
