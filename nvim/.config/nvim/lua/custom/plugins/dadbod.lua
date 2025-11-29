return {
    {
        "tpope/vim-dadbod",
        dependencies = {
            "kristijanhusak/vim-dadbod-ui",
            "kristijanhusak/vim-dadbod-completion",
        },
        config = function()
            vim.keymap.set("n", "<leader>td", "<cmd>DBUIToggle<CR>", { desc = "Database UI Toggle" })
        end,
    },
}
