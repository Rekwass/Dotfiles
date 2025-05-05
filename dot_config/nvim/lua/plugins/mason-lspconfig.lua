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
            "fsautocomplete",
            "html",
            "jsonls",
            "lua_ls",
            "omnisharp",
            "pyright",
            "sqls",
            "ts_ls",
            "yamlls"
        },
        automatic_installation = true,
    }
}
