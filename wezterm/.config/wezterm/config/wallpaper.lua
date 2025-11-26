local wezterm = require("wezterm")

-- local home = wezterm.home_dir
-- local wallpapers_dir = home .. "/.config/wezterm/wallpapers"
--
-- local function get_random_wallpaper(directory)
--     local wallpapers = {}
--     local supported_extensions = { ".png", ".jpg", ".jpeg" }
--
--     local dir = io.popen('ls "' .. directory .. '"')
--     if dir then
--         for file in dir:lines() do
--             for _, ext in ipairs(supported_extensions) do
--                 if file:sub(-#ext) == ext then
--                     table.insert(wallpapers, directory .. "/" .. file)
--                 end
--             end
--         end
--         dir:close()
--     else
--         wezterm.log_error("Failed to open directory: " .. directory)
--     end
--
--     if #wallpapers == 0 then
--         wezterm.log_error("No valid wallpapers found in directory: " .. directory)
--         return nil
--     end
--
--     local random_index = math.random(#wallpapers)
--     return wallpapers[random_index]
-- end
--
-- local random_wallpaper = get_random_wallpaper(wallpapers_dir)

return {
    -- window_background_image = random_wallpaper,
    -- window_background_image_hsb = {
    --     brightness = 0.1,
    --     hue = 1.0,
    --     saturation = 1.0,
    -- },
    window_background_opacity = 0.95,
    macos_window_background_blur = 0,
}
