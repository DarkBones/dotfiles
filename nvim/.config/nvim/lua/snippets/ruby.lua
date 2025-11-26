local ls = require("luasnip")
local s = ls.s
local t = ls.text_node

ls.add_snippets("ruby", {
    s("pry", t("binding.pry_remote")),
    s("header", t({ "# frozen_string_literal: true", "", "" })),
})
