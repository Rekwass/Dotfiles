local M = {}

local lspcfg = require("lspconfig")
local mason = require("mason-lspconfig")

--- Retrieve every LSPs configurations
--- @return table
local function getAllLSP()
    local lsps = {}

    -- The list is defined in the ensure installed of `mason-lspconfig`
    local lspNames = mason.get_installed_servers()

    for _, name in ipairs(lspNames) do
        lsps[name] = require("plugins.lsp." .. name)
    end

    return lsps
end

--- @type table
local lsps = getAllLSP()

--- Setup all LSPs
M.setupAll = function()
    for name, lsp in pairs(lsps) do
        lspcfg[name].setup(lsp.configuration)
    end
end

--- Setup the given list of LSPs
--- @param lspNames string[] Array of server names
M.setupMany = function(lspNames)
    for _, lspName in ipairs(lspNames) do
        lspcfg[lspName].setup(lsps[lspName].configuration)
    end
end

--- Setup one LSP
--- @param lspName string
M.setupOne = function(lspName)
    lspcfg[lspName].setup(lsps[lspName].configuration)
end

return M
