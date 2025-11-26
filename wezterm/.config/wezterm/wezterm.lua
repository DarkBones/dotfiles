local wezterm = require("wezterm")

local config = wezterm.config_builder()

local function merge_tables(t1, t2)
    for k, v in pairs(t2) do
        t1[k] = v
    end
end

local base = require("config.base")
local wallpaper = require("config.wallpaper")

merge_tables(config, base)
merge_tables(config, wallpaper)

return config
