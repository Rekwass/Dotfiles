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


-- /// <summary>
-- /// Description here
-- /// </summary>
-- /// <param name="param1">Does thing a</param>
-- /// <param name="param1">Does thing b</param>
-- /// <return>Returns something</return>
-- public int functionName(int param1, int param2)
-- {
--     return 0;
-- }

-- local parameter, choose_param

-- parameter = function(_, _, _, first_param)
--     if first_param then
--         return sn(nil, { i(1, "int"), t " ", i(2, "param"), d(3, choose_param, {}, { user_args = { false } }) })
--     else
--         return sn(nil, { t ", ", i(1, "int"), t " ", i(2, "param"), d(3, choose_param, {}, { user_args = { false } }) })
--     end
-- end

-- choose_param = function(_, _, _, first_param)
--     return sn(nil, c(1, { t "", d(2, parameter, {}, { user_args = { first_param } }) }))
-- end

-- local function b(args, parent, old_state, user_args)
--     return sn(nil, t "Coucou")
-- end

-- local function a(args, parent, old_state, user_args)
--     return sn(nil, d(1, b))
--     -- return sn(1, f(2, b))
-- end

-- local function reused_func(_, _, _, user_arg1)
--     if user_arg1 then
--         return sn(nil, t "True")
--     else
--         return sn(nil, t "False")
--     end
-- end

local parameter

parameter = function(_, _, _, first_param)
    return sn(nil, c(1, { t "", d(2, function(_, _, _, fs_param)
        if fs_param then
            return sn(nil,
                { i(1, "int"), t " ", i(2, "param"), d(3, parameter, {}, { user_args = { false } }) })
        else
            return sn(nil,
                { t ", ", i(1, "int"), t " ", i(2, "param"), d(3, parameter, {}, { user_args = { false } }) })
        end
    end, {}, { user_args = { first_param } }) }))
end

return {
    -- Namespace
    s({ trig = "namespace", dscr = "Namespace" }, {
        t "namespace ", i(1, "SampleNamespace"), t { "", "{", "\t" }, i(0), t { "", "}" }
    }),
    -- Test
    -- s("test", {
    --     d(1, reused_func, {}, {
    --         user_args = { true }
    --     }),
    -- })
    -- Test
    -- s({ trig = "test", dscr = "test" }, {
    --     d(1, a),
    -- }),
    -- Function
    s({ trig = "fun", dscr = "Function" }, {
        t { "/// <summary>", "/// " },
        i(1),
        t { "", "/// </summary>", "" },
        c(2, { t "public", t "private", t "protected", t "internal" }),
        t " ", i(3, "int"), t " ", i(4, "SampleFunction"), t "(",
        d(5, parameter, {}, { user_args = { true } }), t { ")", "{", "\t" },
        i(0), t { "", "}" }
    }),
    -- Function
    -- s({ trig = "fun", dscr = "Function" }, {
    --     t { "/// <summary>", "/// " },
    --     i(1),
    --     t { "", "/// </summary>", "" },
    --     c(2, { t "public", t "private", t "protected", t "internal" }),
    --     t " ", i(3, "int"), t " ", i(4, "SampleFunction"), t "(",
    --     d(5, choose_param, {}, { user_args = { true } }), t { ")", "{", "\t" },
    --     i(0), t { "", "}" }
    -- }),
}
