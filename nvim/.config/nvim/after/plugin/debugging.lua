-- NOTE: WIP, probs not working yet!

local dap = require("dap")
local dapui = require("dapui")

require("dap").set_log_level("TRACE")
dapui.setup()

dap.defaults.fallback.terminateDebuggee = false

dap.adapters.ruby = {
    type = "server",
    host = "127.0.0.1",
    port = 1234,
}

dap.configurations.ruby = {
    {
        type = "ruby",
        request = "attach",
        name = "Attach to Ruby",
        host = "127.0.0.1",
        port = 1234,
    },
}

dap.listeners.before.attach.dapui_config = function()
    dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
    dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
    dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
    dapui.close()
end

dap.adapters.go = {
    type = "server",
    host = "127.0.0.1",
    port = 38697,
}

dap.configurations.go = {
    {
        type = "go",
        name = "Debug (Docker)",
        request = "attach",
        mode = "remote",
        remotePath = "",
        cwd = "${workspaceFolder}",
        port = 38697,
        host = "127.0.0.1",
        substitutePath = {
            {
                from = "${workspaceFolder}",
                to = "/app",
            },
        },
    },
}

-- Key mappings for nvim-dap
vim.api.nvim_set_keymap("n", "<leader>dc", ':lua require"dap".continue()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap(
    "n",
    "<leader>dt",
    ':lua require"dap".toggle_breakpoint()<CR>',
    { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
    "n",
    "<leader>dd",
    ':lua require"dap".disconnect({ terminateDebuggee = false })<CR>',
    { noremap = true, silent = true }
)
