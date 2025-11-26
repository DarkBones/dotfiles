return {
    "mbbill/undotree",
    config = function()
        vim.g.undotree_SetFocusWhenToggle = 1

        vim.keymap.set("n", "U", vim.cmd.UndotreeToggle, { desc = "[U]ndo tree" })
    end,
}
