require("nvim-treesitter.configs").setup({
    auto_install = true,
    highlight = { enable = true },
    indent = {
        enable = true,
        disable = { "ruby", "nix" },
    },
    ensure_installed = {
        "markdown_inline",
    },
    textobjects = {
        select = {
            enable = true,

            lookahead = true,

            keymaps = {
                ["aa"] = "@parameter.outer",
                ["ia"] = "@parameter.inner",
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
                ["ii"] = "@conditional.inner",
                ["ai"] = "@conditional.outer",
                ["il"] = "@loop.outer",
                ["al"] = "@loop.outer",
                ["at"] = "@comment.outer",
            },

            selection_modes = {
                ["@parameter.outer"] = "v",
                ["@function.outer"] = "V",
                ["@class.outer"] = "<c-v>",
            },
        },
        move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
                ["]f"] = "@function.outer",
                ["]]"] = "@class.outer",
            },
            goto_next_end = {
                ["]F"] = "@function.outer",
                ["]["] = "@class.outer",
            },
            goto_previous_start = {
                ["[f"] = "@function.outer",
                ["[["] = "@class.outer",
            },
            goto_previous_end = {
                ["[F"] = "@function.outer",
                ["[]"] = "@class.outer",
            },
            goto_next = {
                ["]i"] = "@conditional.inner",
            },
            goto_previous = {
                ["[i"] = "@conditional.inner",
            },
        },
        swap = {
            enable = true,
            swap_next = {
                ["<leader>cs"] = "@parameter.inner",
            },
            swap_previous = {
                ["<leader>cS"] = "@parameter.inner",
            },
        },
    },
})
