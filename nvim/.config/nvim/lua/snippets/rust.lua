local ls = require("luasnip")
local s = ls.s
local i = ls.insert_node
local t = ls.text_node
local fmt = require("luasnip.extras.fmt").fmt
local sn = ls.sn
local d = ls.dynamic_node
local c = ls.choice_node

local get_test_result = function(position)
    return d(position, function()
        local nodes = {}
        table.insert(nodes, t(" "))

        local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
        local anyhow_used = false
        for _, line in ipairs(lines) do
            if line:match("anyhow::Result") then
                table.insert(nodes, t(" -> Result<()> "))
                anyhow_used = true
                break
            end
        end

        if anyhow_used == false then
            table.insert(nodes, t(" -> Result<(), ()> "))
        end

        return sn(nil, c(1, nodes))
    end, {})
end

ls.add_snippets("rust", {
    s(
        "test",
        fmt(
            [[
                #[test]
                fn {}(){}{{
                    {}
                }}
            ]],
            {
                i(1, "testname"),
                get_test_result(2),
                i(0),
            }
        )
    ),
})
