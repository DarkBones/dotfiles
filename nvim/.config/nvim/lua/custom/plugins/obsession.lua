return {
    "tpope/vim-obsession",
    dependencies = {
        "folke/which-key.nvim",
    },
    config = function()
        local wk = require("which-key")
=======
    config = function()
>>>>>>> eb947f0 (Add configs)
        local session_dir = vim.fn.expand("~/.dotfiles/vim-sessions")

        vim.fn.mkdir(session_dir, "p")

        local function save_session()
            local session_file = session_dir .. "/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t") .. ".vim"
            vim.cmd("Obsession " .. session_file)
        end

        local function load_session()
            local session_file = session_dir .. "/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t") .. ".vim"
            vim.cmd("source " .. session_file)
        end

        wk.add({
            { "<leader>ol", load_session,      desc = "Load session" },
            { "<leader>os", save_session,      desc = "Save session" },
            { "<leader>od", ":Obsession!<CR>", desc = "Delete session" },
        })
=======
        vim.keymap.set("n", "<leader>ol", load_session, { desc = "Load session" })
        vim.keymap.set("n", "<leader>os", save_session, { desc = "Save session" })
        vim.keymap.set("n", "<leader>od", ":Obsession!<CR>", { desc = "Delete session" })
>>>>>>> eb947f0 (Add configs)
    end,
}
