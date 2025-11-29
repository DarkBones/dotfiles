require("telescope").load_extension("advanced_git_search")

vim.keymap.set("n", "<leader>gs", "<cmd>AdvancedGitSearch<CR>", { desc = "Advanced [S]earch" })
