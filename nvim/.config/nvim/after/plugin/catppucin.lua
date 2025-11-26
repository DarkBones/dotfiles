require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    background = { -- :h background
        light = "latte",
        dark = "mocha",
    },
    transparent_background = true, -- disables setting the background color.
    show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
    term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
    dim_inactive = {
        enabled = false, -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.15, -- percentage of the shade to apply to the inactive window
    },
    no_italic = false, -- Force no italic
    no_bold = false, -- Force no bold
    no_underline = false, -- Force no underline
    styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { "italic" }, -- Change the style of comments
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
        -- miscs = {}, -- Uncomment to turn off hard-coded styles
    },
    color_overrides = {
        all = {
            text = "#ffffff",
        },
        mocha = {
            base = "#000000",
            mantle = "#0a0e12",
            crust = "#121a21",
            base_100 = "#ffffff",
            base_95 = "#eff2f6",
            base_90 = "#dee6ed",
            base_85 = "#ced9e4",
            base_80 = "#bdccdb",
            base_75 = "#adbfd2",
            base_70 = "#9cb3c9",
            base_65 = "#8ca6c0",
            base_60 = "#7b99b7",
            base_55 = "#6b8cae",
            base_50 = "#5b80a4",
            base_45 = "#517394",
            base_40 = "#486684",
            base_35 = "#3f5973",
            base_30 = "#364d63",
            base_25 = "#2d4052",
            base_20 = "#243342",
            base_15 = "#1b2631",
            base_10 = "#121a21",
            base_5 = "#0a0e12",
        },
    },
    custom_highlights = function(colors)
        return {
            CursorLine = { bg = colors.base_20 },
            ColorColumn = { bg = colors.base_10 },
            Visual = { bg = colors.base_30 },
            LineNr = { fg = colors.base_60 },
        }
    end,
    default_integrations = true,
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        mini = {
            enabled = true,
            indentscope_color = "",
        },
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
})

-- setup must be called before loading
vim.cmd.colorscheme("catppuccin")
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#121a21" })  -- Background for floating windows
