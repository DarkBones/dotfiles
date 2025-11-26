-- Function to remove the current quickfix entry
function RemoveCurrentQfEntry()
    -- Get the current quickfix list
    local qf_list = vim.fn.getqflist()
    -- Get the current line in the quickfix window (1-based index)
    local current_line = vim.fn.line(".")
    -- Remove the entry corresponding to the current line (0-based index)
    table.remove(qf_list, current_line)
    -- Update the quickfix list with the modified list
    vim.fn.setqflist(qf_list)
    -- Move to the next entry in the quickfix list and keep focus
    if current_line < #qf_list then
        vim.cmd("cnext")
    end

    vim.cmd("wincmd p")
    vim.cmd("copen")
    -- Only navigate to the quickfix item if there are any items left
    if #qf_list > 0 then
        vim.cmd("cc " .. current_line)
    end
end

-- Set the keybinding for the quickfix filetype
vim.api.nvim_create_autocmd("FileType", {
    pattern = "qf",
    callback = function()
        vim.api.nvim_buf_set_keymap(
            0,
            "n",
            "<C-d>",
            ":lua RemoveCurrentQfEntry()<CR>",
            { noremap = true, silent = true }
        )
    end,
})
