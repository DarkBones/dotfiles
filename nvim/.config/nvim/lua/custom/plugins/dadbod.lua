return {
    {
        "tpope/vim-dadbod",
        dependencies = {
            "kristijanhusak/vim-dadbod-ui",
            "kristijanhusak/vim-dadbod-completion",
            "folke/which-key.nvim",
        },
        config = function()
            local wk = require("which-key")

            wk.add({
                { "<leader>td", "<cmd>DBUIToggle<CR>", desc = "Database UI Toggle" },
            })
=======
        },
        config = function()
            vim.keymap.set("n", "<leader>td", "<cmd>DBUIToggle<CR>", { desc = "Database UI Toggle" })
>>>>>>> eb947f0 (Add configs)
        end,
    },
}
