return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    {
        "kchmck/vim-coffee-script",
        ft = { "coffee", "coffeescript" },
    },
}
