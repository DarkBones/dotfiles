-- TODO: Test and fix
require("nvim-surround").setup({
    keymaps = {
        normal = "<leader>sa",
        normal_cur = "<leader>ssa",
        normal_line = "<leader>sA",
        normal_cur_line = "<leader>sAA",

        delete = "<leader>sd",
        change = "<leader>sc",
        change_line = "<leader>sC",

        visual = "<leader>sa",
        visual_line = "gS",
    },
})
