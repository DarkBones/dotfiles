local wk = require("which-key")

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
