local ls = require("luasnip")
local s = ls.s
local i = ls.insert_node
local t = ls.text_node
local c = ls.choice_node
local d = ls.dynamic_node
local sn = ls.sn
local fmta = require("luasnip.extras.fmt").fmta
local cwd = vim.fn.getcwd()

local function dependencies_choice(position)
    return d(position, function()
        local nodes = {
            t(""),
            t({
                "",
                "    dependencies = {",
                '        "folke/which-key.nvim"',
                "    },",
            }),
        }
        return sn(nil, c(1, nodes))
    end, {})
end

local function config_choice(position)
    return d(position, function()
        local nodes = {
            t(""),
            sn(nil, {
                t({
                    "",
                    "    config = function()",
                    "        ",
                }),
                i(1),
                t({
                    "",
                    "    end,",
                }),
            }),
        }
        return sn(nil, c(1, nodes))
    end, {})
end

if cwd:match("^" .. vim.fn.expand("~/.dotfiles")) then
    ls.add_snippets("lua", {
        s(
            "plugin",
            fmta(
                [[
return {
    "<plugin_path>",<dependencies><config>
}
]],
                {
                    plugin_path = i(1, "example/plugin"),
                    dependencies = dependencies_choice(2),
                    config = config_choice(3),
                }
            )
        ),
    })
end
