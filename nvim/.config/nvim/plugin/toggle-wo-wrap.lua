local wk = require("which-key")

=======
>>>>>>> eb947f0 (Add configs)
vim.wo.wrap = false

function ToggleWrap()
    if vim.wo.wrap then
        vim.wo.wrap = false
    else
        vim.wo.wrap = true
    end
end

wk.add({
    { "<leader>uw", "<cmd>lua ToggleWrap()<CR>", desc = "Toggle Word Wrap" },
})
=======
vim.keymap.set("n", "<leader>uw", "<cmd>lua ToggleWrap()<CR>", { desc = "Toggle Word Wrap" })
>>>>>>> eb947f0 (Add configs)
