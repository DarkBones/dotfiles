require("gitsigns").setup({
    signs = {
        add = { text = "+" },
    },
    signs_staged = {
        add = { text = "+" },
    },
})

local map = vim.keymap.set

map("n", "<leader>gb", "<cmd>G blame<CR>", { desc = "[B]lame" })
map("n", "<leader>gp", "<cmd>Gitsigns preview_hunk<CR>", { desc = "[P]review Hunk" })
map("n", "<leader>gr", "<cmd>Gitsigns reset_hunk<CR>", { desc = "[R]eset Hunk" })
map("n", "<leader>gt", "<cmd>Gitsigns toggle_current_line_blame<CR>", { desc = "[T]oggle Line Blame" })
