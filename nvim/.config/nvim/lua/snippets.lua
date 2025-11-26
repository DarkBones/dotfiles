local function require_all_files(dir)
    local path = vim.fn.stdpath("config") .. "/lua/" .. dir
    for _, file in ipairs(vim.fn.glob(path .. "/**/*.lua", true, true)) do
        local module = file:match("^" .. path .. "/(.*)%.lua$")
        if module then
            package.loaded[dir .. "." .. module] = nil
            require(dir .. "." .. module)
        end
    end
end

require_all_files("snippets")
