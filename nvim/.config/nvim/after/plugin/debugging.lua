-- NOTE: WIP, probs not working yet!

local dap = require("dap")
local dapui = require("dapui")

dap.set_log_level("TRACE")
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

-- Helper: resolve python from active venv
local function get_venv_python()
    local venv = os.getenv("VIRTUAL_ENV")
    if venv and venv ~= "" then
        return venv .. "/bin/python"
    end

    local cwd = vim.fn.getcwd()
    local candidates = {
        cwd .. "/.venv/bin/python",
        cwd .. "/venv/bin/python",
    }

    for _, path in ipairs(candidates) do
        if vim.fn.executable(path) == 1 then
            return path
        end
    end

    if vim.fn.executable("python3") == 1 then
        return "python3"
    end
    return "python"
end

-- Adapter: debugpy
dap.adapters.python = {
    type = "executable",
    command = get_venv_python(),
    args = {
        "-Xfrozen_modules=off",
        "-m",
        "debugpy.adapter",
    },
}

-- Adapter: debugpy (attach)
dap.adapters.pythonAttach = {
    type = "server",
    host = "127.0.0.1",
    port = 5678,
}

dap.configurations.python = {
    {
        type = "python",
        request = "launch",
        name = "Python: module...",
        module = function()
            return vim.fn.input("Module: ", "app.benchmark.main")
        end,
        cwd = "${workspaceFolder}",
        pythonPath = get_venv_python,
        justMyCode = false,
    },
    {
        type = "python",
        request = "launch",
        name = "Python: current file",
        program = "${file}",
        cwd = "${workspaceFolder}",
        pythonPath = get_venv_python,
        justMyCode = false,
    },
    {
        type = "pythonAttach",
        request = "attach",
        name = "Python: attach to local debugpy",
        connect = {
            host = "127.0.0.1",
            port = 5678,
        },
        justMyCode = false,
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

-- Keymaps
local map = vim.keymap.set

map("n", "<leader>dc", function()
    dap.continue()
end, { desc = "Debug: Continue" })

map("n", "<leader>dr", function()
    dap.run_last()
end, { desc = "Debug: Run last" })

map("n", "<leader>dC", function()
    local session = dap.session()
    if session then
        dap.run_to_cursor()
    else
        dap.continue()
    end
end, { desc = "Debug: Run to cursor / Start" })

map("n", "<leader>dt", function()
    dap.toggle_breakpoint()
end, { desc = "Debug: Toggle Breakpoint" })

map("n", "<leader>dT", function()
    dap.terminate()
end, { desc = "Debug: Terminate" })

map("n", "<leader>dd", function()
    dap.disconnect({ terminateDebuggee = false })
end, { desc = "Debug: Disconnect" })
