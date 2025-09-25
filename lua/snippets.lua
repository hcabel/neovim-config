-- Global snippets (find language specific snippets in ftplugin/<filetype>.lua)

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
local rep = require("luasnip.extras").rep
local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("all", {
    s("todo", -- TODO/FIXME/NOTE snippet
        fmt("{} [hcabel {}]: {}", {
            c(1, {
                t "TODO",
                t "FIXME",
                t "NOTE",
            }),
            f(function() return os.date "%Y-%m-%d" end, {}),
            i(0),
        })
    ),
})

ls.add_snippets("lua", {
    s("req", {
        t 'local ', i(1), t ' = require("', rep(1), t '")', i(0)
    }),
    s("fn", {
        t "function(", i(1), t ")", i(0), t { "", "end" }
    }),
    s("lfn", {
        t "local ", i(1), t " = function(", i(2), t ")", i(0), t { "", "end" }
    }),
})

ls.add_snippets("rust", {
    s("fn", {
        t "fn ", i(1), t "(", i(2), t ") {", i(0), t { "", "}" }
    }),
    s("ifok", {
        t "if let Ok(", i(1), t ") = ", i(2), t { " {", "\t" }, i(0), t { "", "}" }
    }),
    s("ifnotok", {
        t "let Ok(", i(1), t ") = ", i(2), t { " else {", "\t" }, i(0), t { "", "}" }
    }),
})
