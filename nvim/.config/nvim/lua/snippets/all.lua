local ls = require("luasnip")
local s = ls.s
local f = ls.function_node

ls.add_snippets("all", {
    s(
        "curtime",
        f(function()
            return os.date("%D - %H:%M")
        end)
    ),
})
