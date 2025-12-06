-- return {
--     "mfussenegger/nvim-dap",
--     dependencies = {
--         "rcarriga/nvim-dap-ui",
--         -- "theHamsta/nvim-dap-virtual-text", -- determine whether needed
--         "nvim-neotest/nvim-nio",
--         -- "nvim-telescope/telescope-dap.nvim",
--     },
-- }
return {
    {
        "jay-babu/mason-nvim-dap.nvim",
        opts = {
            -- This line is essential to making automatic installation work
            -- :exploding-brain
            handlers = {},
            automatic_installation = {
                -- These will be configured by separate plugins.
                exclude = {
                    "delve",
                    "python",
                },
            },
            -- DAP servers: Mason will be invoked to install these if necessary.
            ensure_installed = {
                "bash",
                "codelldb",
                "php",
                "python",
            },
        },
        dependencies = {
            "mfussenegger/nvim-dap",
            "williamboman/mason.nvim",
        },
    },
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            -- "theHamsta/nvim-dap-virtual-text", -- determine whether needed
            "nvim-neotest/nvim-nio",
            "mfussenegger/nvim-dap-python",
            -- "nvim-telescope/telescope-dap.nvim",
        },
    },
    {
        "mfussenegger/nvim-dap-python",
        lazy = true,
        config = function()
            local python = vim.fn.expand("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python")
            require("dap-python").setup(python)
        end,
        -- Consider the mappings at
        -- https://github.com/mfussenegger/nvim-dap-python?tab=readme-ov-file#mappings
        dependencies = {
            "mfussenegger/nvim-dap",
        },
    },
}
