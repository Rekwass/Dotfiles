return function()

    require("nvim-treesitter.configs").setup {
        ensure_installed = { "regex", "bash", "c", "cpp", "python", "lua" },

        auto_install = true,

        highlight = {
            enable = true,
        }
    }

end
