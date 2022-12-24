return function()

    require("mason").setup()
    require("mason-lspconfig").setup({
        ensure_installed = {
            "bashls",
            "clangd",
            "cmake",
            "omnisharp",
            "hls",
            "sumneko_lua",
            "pyright",
            "rust_analyzer",
            "vimls",
            "yamlls"
        },
        automatic_installation = true,
    })

end
