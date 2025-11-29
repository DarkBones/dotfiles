vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.updatetime = 50
vim.opt.colorcolumn = "80"
vim.opt.clipboard = "unnamedplus"

vim.api.nvim_create_autocmd("TextYankPost", {
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({ higroup = "IncSearch", timeout = 150 })
    end,
})
vim.opt.cursorline = true
vim.opt.relativenumber = true
vim.opt.number = true
vim.o.showmode = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes:3"
vim.opt.isfname:append("@-@")

vim.opt.fileformats = { "unix", "dos", "mac" }

vim.opt.autoindent = true
vim.opt.smartindent = true
vim.g.copilot_assume_mapped = true

vim.o.conceallevel = 0
vim.o.concealcursor = "n"

vim.api.nvim_create_autocmd("FileType", {
    pattern = "alpha",
    callback = function()
        vim.g.indent_blankline_enabled = false
    end,
})
vim.opt.inccommand = "split"

function _G.get_relative_filepath()
    return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":.")
end

vim.o.winbar = "%{%v:lua.get_relative_filepath()%}"

local map = vim.keymap.set

-- Center cursor when C-u and C-d-ing
map("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })
map("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
map("n", "<leader>mm", "<cmd>messages<CR>", { desc = "Show Messages" })
map("n", "<leader>sf", "<cmd>source %<CR>", { desc = "Source current file" })
map("n", "<leader>qn", "<cmd>cnext<CR>zz", { desc = "Next quickfix item" })
map("n", "<leader>qp", "<cmd>cprev<CR>zz", { desc = "Previous quickfix item" })

map("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>", { noremap = true, silent = true })

vim.api.nvim_create_augroup("CursorLineControl", { clear = true })

vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter", "FocusGained" }, {
    group = "CursorLineControl",
    callback = function()
        vim.opt_local.cursorline = true
        vim.opt_local.colorcolumn = "80"
    end,
})

vim.api.nvim_create_autocmd({ "WinLeave", "BufLeave", "FocusLost" }, {
    group = "CursorLineControl",
    callback = function()
        vim.opt_local.cursorline = false
        vim.opt_local.colorcolumn = ""
    end,
})
