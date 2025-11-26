return {
    {
        "tpope/vim-fugitive",
        depencencies = {
            "folke/which-key.nvim",
        },
    },
    {
        "lewis6991/gitsigns.nvim",
        dependencies = {
            "folke/which-key.nvim",
        },
    },
    {
        "aaronhallaert/advanced-git-search.nvim",
        cmd = { "AdvancedGitSearch" },
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "tpope/vim-fugitive",
            "tpope/vim-rhubarb",
            "folke/which-key.nvim",
        },
    },
}
