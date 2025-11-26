local cwd = vim.fn.getcwd()
if cwd:match(vim.fn.expand("~/vimwiki/diary/papershift")) then
    local ls = require("luasnip")
    local s = ls.s
    local i = ls.insert_node
    local fmta = require("luasnip.extras.fmt").fmta

    local snippets = {
        s(
            "daylog",
            fmta(
                [[
= <date> =

== Itinerary ==

== Details ==

== Achievements ==

== KALM ==

=== Keep ===

=== Add ===

=== Less ===

=== More ===

== Mood ==
x / 10

== Notes ==
]],
                {
                    date = i(1, os.date("%Y-%m-%d")),
                }
            )
        ),
    }

    ls.add_snippets("vimwiki", snippets)
end
