require("oil").setup({
    columns = { "icon" },
    keymaps = {
        ["<C-h>"] = false,
        ["<C-j>"] = false,
        ["<C-k>"] = false,
        ["<C-l>"] = false,
        ["<M-h>"] = "actions.select_split",
    },
    view_options = {
        show_hidden = true,
        is_always_hidden = function(name, _)
            return name == ".." or name == ".git"
        end,
    },
    skip_confirm_for_simple_edits = true,
    win_options = {
        wrap = true,
    },
})

-- Open the parent directory in current window
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Open parent directory in floating window
vim.keymap.set("n", "<space>-", require("oil").toggle_float)

-- Disable the default '-' behavior in markdown and vimwiki files
vim.api.nvim_create_autocmd({"FileType"}, {
    pattern = {"markdown", "vimwiki"},
    callback = function()
        -- Unmap the default behavior of '-'
        vim.keymap.set("n", "-", "<CMD>Oil<CR>", { buffer = true })
    end
})
