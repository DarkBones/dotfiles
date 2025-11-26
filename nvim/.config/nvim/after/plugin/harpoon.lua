local harpoon = require("harpoon")
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

harpoon.setup({
    mark_branch = true,
})

local wk = require("which-key")

local icon = { icon = "󰦻", color = "green" }

wk.add({
    { "<leader>ha", mark.add_file, desc = "[A]dd current file", icon = icon },
    {
        "<leader>hh",
        function()
            ui.nav_file(1)
        end,
        desc = "Goto File 1",
        icon = icon,
    },
    {
        "<leader>hj",
        function()
            ui.nav_file(2)
        end,
        desc = "Goto File 2",
        icon = icon,
    },
    {
        "<leader>hk",
        function()
            ui.nav_file(3)
        end,
        desc = "Goto File 3",
        icon = icon,
    },
    {
        "<leader>hl",
        function()
            ui.nav_file(4)
        end,
        desc = "Goto File 4",
        icon = icon,
    },
})

wk.add({
    {
        "<C-e>",
        function()
            ui.toggle_quick_menu()
        end,
        desc = "Toggle Harpoon Quick Menu",
        icon = icon,
    },
})
