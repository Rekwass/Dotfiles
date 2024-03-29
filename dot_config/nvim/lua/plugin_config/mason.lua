return function()
    require("mason").setup()
    require("mason-lspconfig").setup({
        ensure_installed = {
            "bashls",
            "clangd",
            "cmake",
            "dockerls",
            "eslint",
            "omnisharp",
            "hls",
            "lua_ls",
            "pyright",
            "rust_analyzer",
            "tsserver",
            "vimls",
            "yamlls"
        },
        automatic_installation = true,
    })
end
