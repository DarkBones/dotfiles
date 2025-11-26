local wk = require("which-key")

vim.o.timeout = true
vim.o.timeoutlen = 300

wk.add({
    {
        "<leader>a",
        group = "AI",
        icon = { icon = "󰚩", color = "red" },
    },
    {
        "<leader>c",
        group = "Code",
    },
    {
        "<leader>f",
        group = "Find",
    },
    {
        "<leader>g",
        group = "Git",
        icon = { icon = "", color = "cyan" },
    },
    {
        "<leader>h",
        group = "Harpoon",
        icon = { icon = "󰦻", color = "green" },
    },
    {
        "<leader>t",
        group = "Tools",
        icon = { icon = "", color = "yellow" },
    },
    {
        "<leader>u",
        group = "UI",
    },
    {
        "<leader>w",
        group = "Wiki",
        icon = { icon = "", color = "blue" },
    },
})

wk.add({
    { "g",
        group = "Go to",
        icon = { icon = "󰵹", color = "green" },
    },
})
