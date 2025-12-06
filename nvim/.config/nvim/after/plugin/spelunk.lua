require("spelunk").setup({
    enable_persist = true,
    cursor_character = ">",
    persist_by_git_branch = true,
    -- base_mappings = {
    --     toggle = "<leader>bt",
    --     add = "<leader>ba",
    --     delete = "<leader>bd",
    --     next_bookmark = "<leader>bN",
    --     prev_bookmark = "<leader>bP",
    --     search_bookmarks = "<leader>bf",
    --     search_current_bookmarks = "<leader>bc",
    --     search_stacks = "<leader>bs",
    --     change_line = "<leader>bl",
    -- },
    enable_wrapping = false,
})

-- vim.keymap.set("n", "<leader>bn", "<leader>bNzz", {
--     remap = true,
--     desc = "Spelunk: next bookmark (centered)",
-- })
--
-- vim.keymap.set("n", "<leader>bp", "<leader>bPzz", {
--     remap = true,
--     desc = "Spelunk: previous bookmark (centered)",
-- })
