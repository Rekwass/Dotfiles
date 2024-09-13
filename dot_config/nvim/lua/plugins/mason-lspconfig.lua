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
            "html",
            "jsonls",
            "lua_ls",
            "omnisharp",
            "pyright",
            "ts_ls",
            "yamlls"
        },
        automatic_installation = true,
    }
}
