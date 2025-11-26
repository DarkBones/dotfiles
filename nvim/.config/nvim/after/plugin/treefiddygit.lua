local wk = require("which-key")
local cwd = vim.fn.getcwd()

require("TreeFiddyGit").setup({
    logging = {
        level = "DEBUG",
    },
    hook = function(action, data)
        vim.schedule(function()
            if cwd:match(vim.fn.expand("~/Developer/papershift")) then
                require("custom.treefiddyhooks.papershift").run_hook(action, data)
            end
        end)
    end,
})

wk.add({
    { "<leader>gw", "<cmd>Telescope tree_fiddy_git get_worktrees<CR>", desc = "Select [W]orktree" },
    { "<leader>gn", "<cmd>Telescope tree_fiddy_git create_worktree<CR>", desc = "[N]ew Worktree" },
    { "<leader>gN", "<cmd>Telescope tree_fiddy_git create_worktree_stash<CR>", desc = "New Worktree with [N]ew Stash" },
    { "<leader>gc", "<cmd>lua require('TreeFiddyGit').checkout_branch()<CR>", desc = "[C]heckout Branch" },
})
