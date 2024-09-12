local default_options = {
    noremap = true,
    silent = true
}

local M = {}

function M.map(mode, keys, action, opts)
    local options = default_options
    if opts then options = vim.tbl_extend("force", options, opts) end

    vim.api.nvim_set_keymap(mode, keys, action, options)
end

function M.buf_map(buffer, mode, keys, action, opts)
    local options = default_options
    if opts then options = vim.tbl_extend("force", options, opts) end

    vim.api.nvim_buf_set_keymap(buffer, mode, keys, action, options)
end

M.icons = {
    Class = " ",
    Color = " ",
    Constant = "ﲀ ",
    Constructor = " ",
    Enum = "練 ",
    EnumMember = " ",
    Event = " ",
    Field = "ﴲ ",
    File = " ",
    Folder = " ",
    Function = " ",
    Interface = "ﰮ ",
    Keyword = " ",
    Method = " ",
    Module = " ",
    Operator = " ",
    Property = "襁 ",
    Reference = " ",
    Snippet = " ",
    Struct = "ﳤ ",
    Text = " ",
    TypeParameter = " ",
    Unit = " ",
    Value = " ",
    Variable = " ",
}

return M
