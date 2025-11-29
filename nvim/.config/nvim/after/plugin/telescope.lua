local telescope = require("telescope")
local builtin = require("telescope.builtin")

telescope.load_extension("live_grep_args")

local function is_dotfiles_repo()
    local dotfiles_repo = os.getenv("DOTFILES_REPO")
    if not dotfiles_repo then
        return false
    end
    local cwd = vim.fn.getcwd()

    return cwd:find(vim.fn.expand(dotfiles_repo), 1, true) ~= nil
end

-- Wrapper function to inject dynamic options
local function telescope_with_hidden(fn)
    return function(opts)
        opts = opts or {}

        if is_dotfiles_repo() then
            opts.hidden = true
            opts.additional_args = function(args)
                table.insert(args, "--hidden")
                return args
            end
        end

        fn(opts)
    end
end

local function grep_word_under_cursor()
    local word = vim.fn.expand("<cword>")
    builtin.live_grep({
        default_text = word,
        additional_args = function()
            return { "--word-regexp", "--ignore-case" }
        end,
    })
end

local function search_partial_word()
    local word = vim.fn.expand("<cword>")
    builtin.live_grep({
        default_text = word,
        additional_args = function()
            return { "--ignore-case" }
        end,
    })
end

local function search_symbol_under_cursor()
    local symbol = vim.fn.expand("<cword>")
    builtin.live_grep({
        default_text = symbol,
        additional_args = function()
            return { "--word-regexp", "--case-sensitive" }
        end,
    })
end

local wk = require("which-key")

wk.add({
    {
        "<C-p>",
        function()
            local opts = {
                file_ignore_patterns = {
                    ".git/",
                    "virtualenvs/",
                    "node_modules/",
                    "__pycache__/",
                    "*.log",
                    "*.tmp",
                    "*.swp",
                    "*.swo",
                    "dist/",
                    "build/",
                    "target/",
                    ".DS_Store",
                },
                hidden = is_dotfiles_repo(),
            }

            builtin.find_files(opts)
        end,
        desc = "Find Files",
    },
}, { mode = "n" })

wk.add({
    {
        "<leader>fa",
        function()
            require("telescope").extensions.live_grep_args.live_grep_args()
        end,
        desc = "Grep Args",
    },
    { "<leader>fb", telescope_with_hidden(builtin.buffers), desc = "List Buffers" },
    { "<leader>fd", telescope_with_hidden(builtin.lsp_document_symbols), desc = "List LSP Document Symbols" },
    { "<leader>fg", telescope_with_hidden(builtin.live_grep), desc = "Live Grep" },
    { "<leader>fh", telescope_with_hidden(builtin.help_tags), desc = "Help Tags" },
    { "<leader>fj", telescope_with_hidden(builtin.jumplist), desc = "Jump List" },
    { "<leader>fm", telescope_with_hidden(builtin.marks), desc = "Marks" },
    { "<leader>fp", search_partial_word, desc = "Grep Partial Word" },
    { "<leader>fs", search_symbol_under_cursor, desc = "Grep Symbol" },
    { "<leader>ft", telescope_with_hidden(builtin.git_status), desc = "Git Status" },
    { "<leader>fw", telescope_with_hidden(grep_word_under_cursor), desc = "Grep Word" },
})
=======
local map = vim.keymap.set

map("n", "<C-p>", function()
    local opts = {
        file_ignore_patterns = {
            ".git/",
            "virtualenvs/",
            "node_modules/",
            "__pycache__/",
            "*.log",
            "*.tmp",
            "*.swp",
            "*.swo",
            "dist/",
            "build/",
            "target/",
            ".DS_Store",
        },
        hidden = is_dotfiles_repo(),
    }

    builtin.find_files(opts)
end, { desc = "Find Files" })

map("n", "<leader>fa", function()
    require("telescope").extensions.live_grep_args.live_grep_args()
end, { desc = "Grep Args" })
map("n", "<leader>fb", telescope_with_hidden(builtin.buffers), { desc = "List Buffers" })
map("n", "<leader>fd", telescope_with_hidden(builtin.lsp_document_symbols), { desc = "List LSP Document Symbols" })
map("n", "<leader>fg", telescope_with_hidden(builtin.live_grep), { desc = "Live Grep" })
map("n", "<leader>fh", telescope_with_hidden(builtin.help_tags), { desc = "Help Tags" })
map("n", "<leader>fj", telescope_with_hidden(builtin.jumplist), { desc = "Jump List" })
map("n", "<leader>fm", telescope_with_hidden(builtin.marks), { desc = "Marks" })
map("n", "<leader>fp", search_partial_word, { desc = "Grep Partial Word" })
map("n", "<leader>fs", search_symbol_under_cursor, { desc = "Grep Symbol" })
map("n", "<leader>ft", telescope_with_hidden(builtin.git_status), { desc = "Git Status" })
map("n", "<leader>fw", telescope_with_hidden(grep_word_under_cursor), { desc = "Grep Word" })
>>>>>>> eb947f0 (Add configs)

local actions = require("telescope.actions")
telescope.setup({
    extensions = {
        ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
        },
    },
    defaults = {
        mappings = {
            i = {
                -- Bind Ctrl-s in insert mode to only selected entries
                ["<C-s>"] = actions.send_selected_to_qflist + actions.open_qflist,
            },
            n = {
                -- Bind Ctrl-s in normal mode to only selected entries
                ["<C-s>"] = actions.send_selected_to_qflist + actions.open_qflist,
            },
        },
    },
})

telescope.load_extension("ui-select")
