local vil = require("illuminate")
local map = vim.keymap.set

vil.configure({
    min_count_to_highlight = 2,
})

map("n", "<leader>ui", vil.toggle, { desc = "[I]llumination Toggle Global" })
map("n", "<leader>uI", vil.toggle_buf, { desc = "[I]llumination Toggle Local" })

map("n", "<A-n>", vil.goto_next_reference, { desc = "[I]llumination Next" })
map("n", "<A-p>", vil.goto_prev_reference, { desc = "[I]llumination Previous" })
