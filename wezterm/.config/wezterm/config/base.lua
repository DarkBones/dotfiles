local wezterm = require("wezterm")

return {
    color_scheme = "Dracula",
    font = wezterm.font_with_fallback({
        "JetBrains Mono",
        { family = "Symbols Nerd Font Mono", scale = 0.75 },
    }),
    enable_tab_bar = false,
    window_decorations = "RESIZE",
    window_padding = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0,
    },

    -- Set cursor colors
    colors = {
        cursor_bg = "white",
        cursor_fg = "black",
        cursor_border = "white",
    },
}
