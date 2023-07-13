return function()
    -- require "alpha".setup(require "alpha.themes.startify".config)

    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Set header
    dashboard.section.header.val = {
        "",
        "",
        "                               __,,,µ╓╓╓╓╓,,,_ _                               ",
        "                        __,╓╗╣╣╣╣╣╣╬╬╬╬╬╣╬╣╣╬╣╣╣╬╗╗╓                           ",
        "                     _╓#▓▓▓╣╣╣╣╬╬╣╬╣╣╣╬▓█╬╬╣╣╣╬╬╣╬╬▓╬╣╬╓_                      ",
        "                 _,▄▓╬╬██▓▓█╬█████╬╬▓████▓╣╬╣╬▓████▓╬╣╬╬╬╬╗,                   ",
        "         _,▄▓▓████████████████████╬██████╬▓███████▓╬╬╬╣╬╬╬╬▓██▌                ",
        "       ╓▓██▓█████████████████████████████╣███████▓╬╬╬╬██▓▓████╬╓               ",
        "     ,▓▓▓▓███████████████████████████████████████╬╬█████████▓╬╬╬╬╓             ",
        "     ▓▓▓▓███████████████████████████████████████████████████▓╬╬╬╬╬╬╕           ",
        "    _▄▓███████████████████████████████████████████████████████▓╬╬╬╬╬╬▄╓▓██╨    ",
        "    █████████████████████████████████████████████████████████╬╬╬▓█▓██████╙     ",
        "    ╙▀▀╟███████████████████████████████████████████████████╬╣██████████▀       ",
        "       ╬╬█████████████████████████████████████████████████████████████╬µ       ",
        "      ║╣██████╬╬████████████████████████████████████████▓█████████████╬╬╓   ,▄▄",
        "      ╬╬▓████╬╬╬╬╬╬█████████████████████████████████████▓███████████▓╬╬╬b╓▓███ ",
        "     ]╬╬╬╣╬╣╬╣╣╬╬╣╣╣▓███████████████████████████████████▓██████████▓╬▓██████▌,▌",
        "     ╞╣╣╣╣╣╣╣╣╣╣╬╣╬╣████████████████████████████████████▓▓█████████████████▌▄█▌",
        "     ╞╣╬╬╣╬╬╬╣╣╣╬╬╬╬╬▓██████████████████████████████████▓█████████████████████ ",
        "     ]╣╬╬╬╬╬╬╬╬╬╣╣▓▓▓█████████████████████████████████████▓╣████████████████▌  ",
        "      ╣╣╬╣╣╣╣╣╬╣╬╬╬▓██████████████████████████████████████▓╣█████████████████ ,",
        "      ║╬╬╬╣╣╣╬╣╬╬╬╣█╬██████████████████████████████████████╣███████████████████",
        "       ╣╣╣╣╣╬╣╣╬╬╣▓╬╣╬█╬████████████████████████████████▓██╣███████████████████",
        "       └╣╬╣╬╣╣╬╬╬╬╬╬╬╣╬╣╬███████████████████████████████▓██╣███████████████████",
        "        └╣╣╬╬╬╣╬╬╬╣╬╬╣╣╬╬╬██████████████████████████████▓██╣███████████████████",
        "          ╣╣╬╬╬╣╣▓▓▓▓▓╬╬▓▓▓██████████████████████████████▓█╣▓██████████████████",
        "           ▓▓▓▓██████████████████████████████████████████▓█╬▓██████████████████",
        "           ▀▀█████████████████████▓██████████████████████▓▓╬▓███████▓██████████",
        "          ▀▓▓▓████████████▓╬╬╬╬╬██▓╣╬████████████████████▓▓╬╣▓████▓████████████",
        "              ▓████▓╬╬╬╬╬╬╬╬╬╬╬▓███▓▓╬▓██████████████████▓▓▓╣▓████▓██▓█████████",
        "                   ╙╚╣╬╬╬╬╬╬╣╬▓████▓█╬███████████████████████▓▓██▓█████▓███████",
        "                       ╙╝╣╬╬╬╣████▓▓▓▓███████████████████████▓▓█▓▓▓██▓█▓███████",
        "                           └╣███▓▓███████████████████████████▓▓█▓▓╣▓▓▓█▓█████▓▓",
        "                          ╓▓▓▓▓▓▓████████████████████████████████╬╣╬▓▓▓▓█████▓█",
        "                         @╬▓▓▓▓▓▓╣██████████████████████████████▓╬╬▓▓▓▓▓█████▓█",
        "                        ]╝╝╝▓▓▓▓▓▓█████████████████████████████▓▓▓▓▓▓▓╝▓▓██████",
        "",
        "",
        "          ██████╗ ███████╗██╗  ██╗██╗       ██╗ █████╗  ██████╗ ██████╗        ",
        "          ██╔══██╗██╔════╝██║ ██╔╝██║  ██╗  ██║██╔══██╗██╔════╝██╔════╝        ",
        "          ██████╔╝█████╗  █████═╝ ╚██╗████╗██╔╝███████║╚█████╗ ╚█████╗         ",
        "          ██╔══██╗██╔══╝  ██╔═██╗  ████╔═████║ ██╔══██║ ╚═══██╗ ╚═══██╗        ",
        "          ██║  ██║███████╗██║ ╚██╗ ╚██╔╝ ╚██╔╝ ██║  ██║██████╔╝██████╔╝        ",
        "          ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝  ╚═╝   ╚═╝  ╚═╝  ╚═╝╚═════╝ ╚═════╝         ",
    }

    -- Set menu
    dashboard.section.buttons.val = {
        dashboard.button("e", "ﱐ  > New file", ":ene <BAR> startinsert <CR>"),
        dashboard.button("f", "  > Find file", ":lua require(\"telescope.builtin\").find_files({hidden=true})<CR>"),
        dashboard.button("g", "  > Grep content", ":lua require(\"telescope.builtin\").live_grep()<CR>"),
        dashboard.button("r", "  > Recent", ":Telescope oldfiles<CR>"),
        dashboard.button("q", "  > Quit NVIM", ":qa<CR>"),
    }

    -- Send config to alpha
    alpha.setup(dashboard.opts)

    vim.api.nvim_create_autocmd("FileType", {
        desc = "Disable folding on alpha buffer",
        pattern = "alpha",
        group = vim.api.nvim_create_augroup("alpha_nvim", { clear = true }),
        command = "setlocal nofoldenable",
    })
end
