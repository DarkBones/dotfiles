local wk = require("which-key")

require("gitsigns").setup({
    signs = {
        add = { text = "+" },
    },
    signs_staged = {
        add = { text = "+" },
    },
})

wk.add({
    { "<leader>gb", "<cmd>G blame<CR>", desc = "[B]lame" },
    { "<leader>gp", "<cmd>Gitsigns preview_hunk<CR>", desc = "[P]review Hunk" },
    { "<leader>gr", "<cmd>Gitsigns reset_hunk<CR>", desc = "[R]eset Hunk" },
    { "<leader>gt", "<cmd>Gitsigns toggle_current_line_blame<CR>", desc = "[T]oggle Line Blame" },
})
