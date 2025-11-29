return {
    "vimwiki/vimwiki",
    dependencies = {
        "tpope/vim-markdown",
    },
    init = function()
        vim.g.vimwiki_list = {
            {
                path = "~/vimwiki/work",
                diary_rel_path = "diary/",
                diary_index = "diary",
                diary_header = "Work Diary",
                diary_sort = "desc",
                diary_frequency = "daily",
                diary_link_date_format = "%Y-%m-%d",
            },
            {
                path = "~/vimwiki/personal/",
                diary_rel_path = "journal/",
                diary_index = "journal",
                diary_header = "Personal Journal",
                diary_sort = "desc",
                diary_frequency = "daily",
                diary_link_date_format = "%Y-%m-%d",
            },
        }

        vim.g.vimwiki_diary_template = "~/vimwiki/work/diary_templates/default.wiki"

        vim.api.nvim_create_autocmd("FileType", {
            pattern = "vimwiki",
            callback = function()
                vim.keymap.set(
                    "n",
                    "+",
                    "<Plug>VimwikiRemoveHeaderLevel",
                    { silent = true, buffer = true, desc = "VimwikiRemoveHeaderLevel" }
                )

                local colors = require("catppuccin.palettes").get_palette("mocha")

                vim.cmd("hi VimwikiHeader1 guifg=" .. colors.rosewater)
                vim.cmd("hi VimwikiHeader2 guifg=" .. colors.green)
                vim.cmd("hi VimwikiHeader3 guifg=" .. colors.mauve)
                vim.cmd("hi VimwikiHeader4 guifg=" .. colors.lavender)
                vim.cmd("hi VimwikiHeader5 guifg=" .. colors.maroon)
                vim.cmd("hi VimwikiHeader6 guifg=" .. colors.sapphire)
            end,
        })

        local machine_type = os.getenv("MACHINE_TYPE")
        local default_diary_index = 1 -- Default to work
        if machine_type == "personal" then
            default_diary_index = 2 -- Use personal wiki
        end
        vim.keymap.set(
            "n",
            "<Leader>w<Leader>w",
            ":VimwikiMakeDiaryNote " .. default_diary_index .. "<CR>",
            { silent = true, desc = "Open Default Diary" }
        )
        vim.keymap.set("n", "<Leader>ww", ":VimwikiIndex 1<CR>", { silent = true, desc = "Open Work Wiki" })
        vim.keymap.set("n", "<Leader>wp", ":VimwikiIndex 2<CR>", { silent = true, desc = "Open Personal Wiki" })
        vim.keymap.set("n", "<Leader>wl", ":e ~/vimwiki/personal/Things To Learn.wiki<CR>", { silent = true, desc = "Open Things To Learn" })

        local function populate_template(template_path)
            -- Check if the file is empty
            if vim.fn.line("$") > 1 or vim.fn.getline(1) ~= "" then
                print("Error: File not empty. Not applying template file at " .. template_path)
                return
            end

            local template_file = io.open(template_path, "r")

            if template_file == nil then
                print("Error: Could not open template file at " .. template_path)
                return
            end

            local content = template_file:read("*all")
            template_file:close()

            local today_date = os.date("%Y-%m-%d")

            content = content:gsub("%%date%%", today_date)
            vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(content, "\n"))
        end

        vim.api.nvim_create_autocmd("BufNewFile", {
            pattern = vim.fn.expand("~") .. "/vimwiki/work/diary/*",
            callback = function()
                populate_template(vim.fn.expand("~") .. "/vimwiki/work/diary_templates/diary.wiki")
            end,
        })

        vim.api.nvim_create_autocmd("BufNewFile", {
            pattern = vim.fn.expand("~") .. "/vimwiki/personal/journal/*",
            callback = function()
                populate_template(vim.fn.expand("~") .. "/vimwiki/personal/journal_templates/journal.wiki")
            end,
        })
    end,
}
