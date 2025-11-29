local map = vim.keymap.set

local function yank_whole_file(include_ticks)
    local ft = vim.bo.filetype
    local relpath = vim.fn.expand("%:.")

    local commentstring = vim.bo.commentstring
    local comment_prefix = commentstring:match("^(.*)%%s")
    if not comment_prefix then
        -- Default to '#' if commentstring is not set
        comment_prefix = "# "
    end

    local content = vim.api.nvim_buf_get_lines(0, 0, -1, false)
    local code_block = {}
    if include_ticks then
        table.insert(code_block, "```" .. ft)
    end

    table.insert(code_block, comment_prefix .. relpath)
    for _, line in ipairs(content) do
        table.insert(code_block, line)
    end

    if include_ticks then
        table.insert(code_block, "```")
    end

    -- Convert the code block to a string
    local code_block_str = table.concat(code_block, "\n")

    -- Copy the code block to the clipboard
    vim.fn.setreg("+", code_block_str)

    -- Notify the user
    print("Code block copied to clipboard!")
end

local function yank_file_path()
    vim.fn.setreg("+", vim.fn.expand("%:."))
end

local function yank_absolute_file_path()
    vim.fn.setreg("+", vim.fn.expand("%:p"))
end

map("n", "y.", yank_file_path, { desc = "Yank current filepath" })
map("n", "y,", yank_absolute_file_path, { desc = "Yank current absolute filepath" })
map("n", "<leader>y.", function()
    yank_whole_file(true)
end, { desc = "Yank whole file for sharing" })
map("n", "<leader>y,", function()
    yank_whole_file(false)
end, { desc = "Yank whole file for sharing" })
map("v", "<leader>p", '"_dP', { desc = "Paste without overwriting clipboard" })
map("v", "<leader>c", '"_c', { desc = "Change without overwriting clipboard" })
map("v", "<leader>d", '"_d', { desc = "Delete without overwriting clipboard" })
