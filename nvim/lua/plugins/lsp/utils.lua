local M = {}

local mason = require("mason-lspconfig")

--- Retrieve every LSPs configurations
--- @return table
local function getAllLSP()
    local lsps = {}

    -- The list is defined in the ensure installed of `mason-lspconfig`
    local lspNames = mason.get_installed_servers()

    for _, name in ipairs(lspNames) do
        -- WARNING: Required to prevent configuring the lsp twice with haskell-tools.nvim
        if name ~= "hls" then
            lsps[name] = require("plugins.lsp." .. name)
        end
    end

    return lsps
end

--- @type table
local lsps = getAllLSP()

--- Setup all LSPs
M.setupAll = function()
    for name, lsp in pairs(lsps) do
        vim.lsp.config(name, lsp.configuration)
        vim.lsp.enable(name);
    end
end

--- Setup the given list of LSPs
--- @param lspNames string[] Array of server names
M.setupMany = function(lspNames)
    for _, lspName in ipairs(lspNames) do
        vim.lsp.config(lspName, lsps[lspName].configuration)
        vim.lsp.enable(lspName);
    end
end

--- Setup one LSP
--- @param lspName string
M.setupOne = function(lspName)
    vim.lsp.config(lspName, lsps[lspName].configuration)
    vim.lsp.enable(lspName);
end

return M
