local sm = require("supermaven-nvim")
local map = vim.keymap.set

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

local api = require("supermaven-nvim.api")
api.use_free_version()

map("n", "<leader>at", "<cmd>SupermavenToggle<CR>", { desc = "SuperMaven Toggle" })
