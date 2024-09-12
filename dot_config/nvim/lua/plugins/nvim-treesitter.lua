return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
        ensure_installed = { "regex", "bash", "c", "cpp", "python", "lua", "vim", "markdown", "markdown_inline" },
        auto_install = true,
        highlight = {
            enable = true,
        },
        indent = {
            enable = true,
        },
        additional_vim_regex_highlighting = false,
    },
}
