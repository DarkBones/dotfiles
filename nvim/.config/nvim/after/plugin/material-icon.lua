local devicons = require("nvim-web-devicons")
-- local material_icon = require("nvim-material-icon")

devicons.setup({
    override = {
        zsh = {
            icon = "",
            color = "#428850",
            cterm_color = "65",
            name = "Zsh",
        },
        -- Custom icons for diagnostic signs
        DiagnosticSignError = {
            icon = "",
            color = "#db4b4b",
            cterm_color = "1",
            name = "DiagnosticSignError",
        },
        DiagnosticSignWarn = {
            icon = "",
            color = "#e0af68",
            cterm_color = "3",
            name = "DiagnosticSignWarn",
        },
        DiagnosticSignHint = {
            icon = "",
            color = "#10B981",
            cterm_color = "6",
            name = "DiagnosticSignHint",
        },
        DiagnosticSignInfo = {
            icon = "",
            color = "#0db9d7",
            cterm_color = "2",
            name = "DiagnosticSignInfo",
        },
    },
    color_icons = true,
    default = true,
})

vim.diagnostic.config({
    virtual_text = true,
    update_in_insert = false,
    float = {
        border = "rounded",
        source = "always",
    },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.HINT] = "",
            [vim.diagnostic.severity.INFO] = "",
        },
    },
})
