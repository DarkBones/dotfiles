local cp = require("CopilotChat")
local wk = require("which-key")

cp.setup({
    question_header = "💀 DarkBones ",
    answer_header = "󰇥  Rubber Duckie ",
    context = "buffers",
    window = {
        width = 0.25,
    },
    mappings = {
        reset = {
            normal = "<C-w>",
            insert = "<C-w>",
        },
        show_diff = {
            normal = " gp",
        },
        show_context = {
            normal = " gs",
        },
        close = {
            normal = "<C-c>",
            insert = "<C-c>",
        },
        submit_prompt = {
            normal = "<C-s>",
            insert = "<C-s>",
        },
    },
})

wk.add({
    { "<leader>ac", "<cmd>CopilotChatToggle<CR>", desc = "Open Copilot Chat", mode = { "n", "v" } },
})
