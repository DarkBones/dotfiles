local cwd = vim.fn.getcwd()

if cwd:match(vim.fn.expand("~/Developer/papershift")) then
    local ls = require("luasnip")
    local s = ls.s
    local i = ls.insert_node
    local r = require("luasnip.extras").rep
    local fmta = require("luasnip.extras.fmt").fmta

    -- Define markdown snippets
    local markdown_snippets = {
        s(
            "ticket",
            fmta(
                [[
- <description>
  Task: [CORE-<ticket_number>](https://papershift.atlassian.net/browse/CORE-<ticket_number_repeat>) | Author: [Bas Donker](https://github.com/DarkBones)
]],
                {
                    description = i(1, "Description of ticket"),
                    ticket_number = i(2, "123"),
                    ticket_number_repeat = r(2),
                }
            )
        ),
    }

    ls.add_snippets("markdown", markdown_snippets)
    ls.add_snippets("vimwiki", markdown_snippets)
end
