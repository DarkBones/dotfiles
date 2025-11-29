local harpoon = require("harpoon")

harpoon:setup({
    settings = {
        save_on_toggle = true,
        key = function()
            local branch = vim.fn.system("git branch --show-current"):gsub("\n", "")
            if vim.v.shell_error ~= 0 then
                return vim.loop.cwd()
            end
            return vim.loop.cwd() .. "-" .. branch
        end,
    },
})

local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    require("telescope.pickers")
        .new({}, {
            prompt_title = "Harpoon",
            finder = require("telescope.finders").new_table({
                results = file_paths,
            }),
            previewer = conf.file_previewer({}),
            sorter = conf.generic_sorter({}),
        })
        :find()
end

local map = vim.keymap.set

map("n", "<leader>ha", function()
    harpoon:list():add()
end, { desc = "Add current file to Harpoon" })
map("n", "<C-e>", function()
    toggle_telescope(harpoon:list())
end, { desc = "Open Harpoon window" })
map("n", "<leader>hh", function()
    harpoon:list():select(1)
end, { desc = "Harpoon: Goto File 1" })
map("n", "<leader>hj", function()
    harpoon:list():select(2)
end, { desc = "Harpoon: Goto File 2" })
map("n", "<leader>hk", function()
    harpoon:list():select(3)
end, { desc = "Harpoon: Goto File 3" })
map("n", "<leader>hl", function()
    harpoon:list():select(4)
end, { desc = "Harpoon: Goto File 4" })
