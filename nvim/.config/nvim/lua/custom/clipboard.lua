-- Robust, OS-aware clipboard setup for Neovim.

local fn = vim.fn

local function has_exe(cmd)
    return fn.executable(cmd) == 1
end

-- Only bother if Neovim supports +clipboard
if fn.has("clipboard") == 1 then
    local wayland = vim.env.WAYLAND_DISPLAY
    local x11 = vim.env.DISPLAY

    if wayland ~= nil and wayland ~= "" and has_exe("wl-copy") and has_exe("wl-paste") then
        ---------------------------------------------------------------------------
        -- Wayland (wl-clipboard)
        ---------------------------------------------------------------------------
        vim.g.clipboard = {
            name = "wayland-clipboard",
            copy = {
                ["+"] = "wl-copy --foreground --type text/plain",
                ["*"] = "wl-copy --foreground --primary --type text/plain",
            },
            paste = {
                ["+"] = "wl-paste --no-newline",
                ["*"] = "wl-paste --primary --no-newline",
            },
        }
        vim.opt.clipboard = "unnamedplus"
    elseif x11 ~= nil and x11 ~= "" and has_exe("xclip") then
        ---------------------------------------------------------------------------
        -- X11 (xclip preferred)
        ---------------------------------------------------------------------------
        vim.g.clipboard = {
            name = "xclip-clipboard",
            copy = {
                ["+"] = "xclip -selection clipboard",
                ["*"] = "xclip -selection primary",
            },
            paste = {
                ["+"] = "xclip -selection clipboard -o",
                ["*"] = "xclip -selection primary -o",
            },
        }
        vim.opt.clipboard = "unnamedplus"
    elseif x11 ~= nil and x11 ~= "" and has_exe("xsel") then
        ---------------------------------------------------------------------------
        -- X11 (xsel fallback)
        ---------------------------------------------------------------------------
        vim.g.clipboard = {
            name = "xsel-clipboard",
            copy = {
                ["+"] = "xsel --nodetach -i -b",
                ["*"] = "xsel --nodetach -i -p",
            },
            paste = {
                ["+"] = "xsel -o -b",
                ["*"] = "xsel -o -p",
            },
        }
        vim.opt.clipboard = "unnamedplus"
    end
end
