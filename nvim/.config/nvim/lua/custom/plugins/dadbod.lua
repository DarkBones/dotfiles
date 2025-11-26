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
        end,
    },
}
