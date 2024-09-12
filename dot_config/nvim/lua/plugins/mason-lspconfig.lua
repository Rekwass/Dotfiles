return {
    "williamboman/mason-lspconfig.nvim",
    opts = {
        ensure_installed = {
            "bashls",
            "clangd",
            "cmake",
            "cssls",
            "dockerls",
            "eslint",
            "hls",
            "html",
            "jsonls",
            "lua_ls",
            "omnisharp",
            "pyright",
            "tsserver",
            "yamlls"
        },
        automatic_installation = true,
    }
}
