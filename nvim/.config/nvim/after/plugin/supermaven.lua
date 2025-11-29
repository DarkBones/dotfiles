local sm = require("supermaven-nvim")
local wk = require("which-key")
=======
local map = vim.keymap.set
>>>>>>> eb947f0 (Add configs)

sm.setup({
    keymaps = {
        accept_word = "<M-w>",
        accept_suggestion = "<C-a>",
        clear_suggestion = "<M-q>",
    },
    -- disable_inline_completion = true,
    condition = function()
        return true -- Disable Supermaven by default
    end,
})

wk.add({
    { "<leader>at", "<cmd>SupermavenToggle<CR>", desc = "SuperMaven Toggle" },
})
=======
map("n", "<leader>at", "<cmd>SupermavenToggle<CR>", { desc = "SuperMaven Toggle" })
>>>>>>> eb947f0 (Add configs)
