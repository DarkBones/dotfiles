local ls = require("luasnip")
local s = ls.s
local t = ls.text_node

ls.add_snippets("sh", {
    s("header", t({ "#!/bin/bash", "", "" })),
})
