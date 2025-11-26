require("telescope").load_extension("advanced_git_search")

local wk = require("which-key")

wk.add({
    { "<leader>gs", "<cmd>AdvancedGitSearch<CR>", desc = "Advanced [S]earch" },
})
