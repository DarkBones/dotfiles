local wk = require("which-key")

function ToggleLineNumber()
    ---@diagnostic disable-next-line: undefined-field
    if vim.opt.relativenumber:get() then
        vim.opt.relativenumber = false
    else
        vim.opt.relativenumber = true
    end
end

wk.add({
    { "<leader>ul", "<cmd>lua ToggleLineNumber()<CR>", desc = "Toggle Relative Line Numbers" },
})
