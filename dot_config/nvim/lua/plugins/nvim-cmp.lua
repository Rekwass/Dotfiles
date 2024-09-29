return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "neovim/nvim-lspconfig", -- Should be loaded before nvim-cmp
        "L3MON4D3/LuaSnip",      -- Must provide a snippet engine
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "saadparwaiz1/cmp_luasnip",
    },
    config = function()
        local luasnip = require("luasnip")
        local cmp = require("cmp")
        local kind_icons = require("utils").icons
        local ellipsis_char = "…"
        local max_label_width = 69

        cmp.setup({
            -- Define a snipet engine
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            -- Configure sources, if none of luansnip nor nvim_lsp are available, fallback on buffer and path
            sources = cmp.config.sources({
                { name = "luasnip",  prioriry = 100 },
                { name = "nvim_lsp", prioriry = 50 },
            }, {
                { name = "buffer" },
                { name = "path" },
            }),
            -- Highlight and select first item
            completion = {
                completeopt = 'menu,menuone,noinsert'
            },
            -- Nice window borders
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            -- Configure mappings
            mapping = cmp.mapping.preset.insert({
                ["<CR>"] = cmp.mapping.confirm { select = true },
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-j>"] = cmp.mapping.scroll_docs(4),
                ["<C-k>"] = cmp.mapping.scroll_docs(-4),
                ["<C-n>"] = cmp.mapping(function()
                    luasnip.change_choice(1)
                end, { "i", "s" }),
                ["<C-p>"] = cmp.mapping(function()
                    luasnip.change_choice(-1)
                end, { "i", "s" }),
                ["<ESC>"] = cmp.mapping.abort(),
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            }),
            -- Formatting how it should display extra information (icon, source, ...)
            formatting = {
                format = function(entry, vim_item)
                    if kind_icons[vim_item.kind] ~= nil then
                        vim_item.kind = string.format("%s(%s)", kind_icons[vim_item.kind], vim_item.kind)
                    else
                        vim_item.kind = string.format("(%s)", vim_item.kind)
                    end

                    vim_item.menu = ({
                        luasnip = "[LuaSnip]",
                        nvim_lsp = "[LSP]",
                        buffer = "[Buffer]",
                        nvim_lua = "[Lua]",
                        latex_symbols = "[LaTeX]",
                    })[entry.source.name]

                    local label = vim_item.abbr
                    local truncated_label = vim.fn.strcharpart(label, 0, max_label_width)

                    if truncated_label ~= label then
                        vim_item.abbr = truncated_label .. ellipsis_char
                    end

                    return vim_item
                end
            }
        })

        local cmdlineConfig = {
            -- Disable selection of the first item and select first item
            completion = {
                completeopt = 'menu,menuone,noselect'
            },
            -- Map <CR> to select an item. WARNING: Mapping are shared whatever the first character is (/, :, ...)
            mapping = cmp.mapping.preset.cmdline({
                ["<CR>"] = { c = cmp.mapping.confirm({ select = false }) }
            }),
        }

        -- Configure the mappings and sources in COMMAND mode starting with '/'
        cmp.setup.cmdline('/', {
            completion = cmdlineConfig.completion,
            mapping = cmdlineConfig.mapping,
            sources = {
                { name = 'buffer' }
            },
        })

        -- Configure the mappings and sources in COMMAND mode starting with ':'
        cmp.setup.cmdline(':', {
            completion = cmdlineConfig.completion,
            mapping = cmdlineConfig.mapping,
            sources = cmp.config.sources({
                { name = 'path' }
            }, {
                {
                    name = 'cmdline',
                    option = {
                        ignore_cmds = { 'Man', '!' }
                    }
                }
            }),
        })
    end,
}
