return {
    {
        "github/copilot.vim",
        dependencies = { "folke/which-key.nvim" },
    },
    {
        {
            "CopilotC-Nvim/CopilotChat.nvim",
            branch = "main",
            dependencies = {
                { "github/copilot.vim" },
                { "nvim-lua/plenary.nvim" },
                { "folke/which-key.nvim" },
            },
        },
    },
}
