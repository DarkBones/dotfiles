require("neo-tree").setup({
    filesystem = {
        filtered_items = {
            visible = true,
        },
        follow_current_file = {
            enabled = true,
            leave_dirs_open = false,
        },
    },
})

vim.keymap.set("n", "<C-n>", ":Neotree filesystem toggle left<CR>")
