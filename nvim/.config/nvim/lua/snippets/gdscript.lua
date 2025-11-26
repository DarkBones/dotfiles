local ls = require("luasnip")
local s = ls.s
local t = ls.text_node

ls.add_snippets("gdscript", {
    s("save", t("var save_data = SaveManager.save_data")),
})
