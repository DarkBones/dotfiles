return {
    {
        -- Server definitions
        "neovim/nvim-lspconfig",
        dependencies = {
            "nvim-telescope/telescope.nvim",

            -- Install servers/formatters
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",

            -- Completion
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",

            -- External formatters/linters
            "nvimtools/none-ls.nvim",
            "jay-babu/mason-null-ls.nvim",
        },
    },
}
