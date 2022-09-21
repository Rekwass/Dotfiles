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

return {
	s("tekh", {
  t("/*"),
    t({"", "** EPITECH PROJECT, "}), d(1, date),
    t({"", "** "}), i(2, "$TM_FILENAME"),
    t({"", "** File description:"}),
    t({"", "** "}), i(3, "$TM_FILENAME_BASE"),
    t({"", "*/", "", ""}),
    i(0)
  })
}

-- return {
--   s("extras5", { extras.partial(os.date, "%Y") }),
-- }
