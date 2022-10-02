local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local fmt = require("luasnip.extras.fmt").fmt
local extras = require("luasnip.extras")
local m = extras.m
local l = extras.l
local rep = extras.rep
local postfix = require("luasnip.extras.postfix").postfix


local date = function(_, snip)
    return sn(nil, {
        i(1, snip.env.CURRENT_YEAR)
    })
end, {}

local file_name = function(_, snip)
    return sn(nil, {
        i(1, snip.env.TM_FILENAME)
    })
end, {}

local file_name_base = function(_, snip)
    return sn(nil, {
        i(1, snip.env.TM_FILENAME_BASE)
    })
end, {}

-- std::cout << "Message" << std::endl;

return {
    s({ trig = "tekh", dscr = "EPITECH Header" }, {
        t("/*"),
        t({ "", "** EPITECH PROJECT, " }), d(1, date),
        t({ "", "** " }), d(2, file_name),
        t({ "", "** File description:" }),
        t({ "", "** " }), d(3, file_name_base),
        t({ "", "*/", "", "" }),
        i(0)
    }),
    s({ trig = "for", dscr = "basic 'for' snippet" }, {
        t("for ("), i(1, "int"), t(" "), i(2, "i"), t(" = "), i(3, "0"), t("; "),
        rep(2), t(" < "), i(4, "length"), t("; "),
        rep(2), t({ ") {", "\t\t" }), i(0), t({ "", "}" })
    }),
    s({ trig = "class", dscr = "'class' snippet" }, {
        t({ "/**", "* " }), i(2, "description"),
        t({ "", "*/", "class " }), i(1, "MyClass"), t({ " {", "\t public:", "\t\t" }),
        rep(1), t({ "() noexcept = default;", "\t\t" }),
        rep(1), t("("), rep(1), t({ " const& other) = default;", "\t\t" }),
        rep(1), t("("), rep(1), t({ "&& other) noexcept = default;", "", "\t\t" }),
        rep(1), t("& operator=("), rep(1), t({ " const& other) noexcept = default;", "\t\t" }),
        rep(1), t("& operator=("), rep(1), t({ "&& other) noexcept = default;", "\t\t~" }),
        rep(1), t({ "() noexcept = default;", "", "\t private:", "};" })
    }),
    s({ trig = "out", dscr = "'str::cout' snippet" }, {
        t("std::cout << "), i(1, "\"Message\""), t(" << "), c(2, {
            t("std::endl"),
            t("\"\\n\"")
        }), t(";")
    })
}
