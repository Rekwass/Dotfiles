return {
    "mfussenegger/nvim-lint",
    config = function()
        local lint = require("lint");

        lint.linters_by_ft = {
            python = { "flake8" },
        }

        vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave", "BufEnter" }, {
            callback = function()
                -- try_lint without arguments runs the linters defined in `linters_by_ft`
                -- for the current filetype
                lint.try_lint()
            end,
        })
    end,
}
