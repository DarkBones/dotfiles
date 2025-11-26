require("nvim-surround").setup({
    keymaps = {
        normal = "<leader>sa",
        normal_cur = "<leader>ssa",
        normal_line = "<leader>sA",
        normal_cur_line = "<leader>sAA",
        visual = "S",
        visual_line = "gS",
        change = "<leader>sc",
        delete = "<leader>sd",
        change_line = "<leader>sC",
    },
})
