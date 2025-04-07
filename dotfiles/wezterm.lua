-- https://wezfurlong.org/wezterm/config/lua/config/index.html
local wezterm         = require 'wezterm'

local config          = wezterm.config_builder()
local color_scheme    = require 'color_scheme'

config.color_scheme   = color_scheme
config.enable_tab_bar = false
config.font           = wezterm.font "geistmono nerd font"
config.font_size      = 17
config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
}
config.keys           = {
    -- Turn off the default CMD-m Hide action, allowing CMD-m to
    -- be potentially recognized and handled by the tab
    {
        key = 'w',
        mods = 'SUPER',
        action = wezterm.action.DisableDefaultAssignment,
    },
}
-- config.font_dirs      = { '.nix-profile/share/fonts/' }

return config
