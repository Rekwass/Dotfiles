-- Using `opts` does not enable highlights by default for some reason.
-- Even Folke in his LazyNvim configuration uses the `config` field.
-- https://github.com/nvim-treesitter/nvim-treesitter/wiki/Installation#lazynvim
return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = { "regex", "bash", "c", "cpp", "c_sharp", "haskell", "python", "lua", "vim", "markdown", "markdown_inline" },
            auto_install = true,
            highlight = {
                enable = true,
            },
            indent = {
                enable = true,
            },
            additional_vim_regex_highlighting = false,
        })
    end,
}
