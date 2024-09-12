return {
    "L3MON4D3/LuaSnip",
    build = "make install_jsregexp",
    keys = {
        { "<C-n>", "<Plug>luasnip-next-choice", mode = { "i", "s" }, desc = "Select the next choice in a snippet" },
        { "<C-p>", "<Plug>luasnip-prev-choice", mode = { "i", "s" }, desc = "Select the previous choice in a snippek" },
    },
    config = function()
        local ls = require("luasnip")

        ls.setup({
            update_events = "TextChanged,TextChangedI", -- Update snippets dynamically as I type
            ext_base_prio = 200,                        -- Might not be needed
        })

        require("luasnip.loaders.from_lua").load({ paths = "./lua/snippets" })

        local function leave_snippet()
            if ((vim.v.event.old_mode == 's' and vim.v.event.new_mode == 'n') or vim.v.event.old_mode == 'i')
                and ls.session.current_nodes[vim.api.nvim_get_current_buf()]
                and not ls.session.jump_active
            then
                ls.unlink_current()
            end
        end

        vim.api.nvim_create_autocmd("ModeChanged", {
            group = vim.api.nvim_create_augroup("LuaSnip", { clear = true }),
            desc = "Stop snippets when you leave to normal mode",
            pattern = "*",
            callback = leave_snippet,
        })
    end,
}
