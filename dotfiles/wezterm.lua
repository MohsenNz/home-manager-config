-- https://wezfurlong.org/wezterm/config/lua/config/index.html
local wezterm        = require 'wezterm'

local c              = wezterm.config_builder()
local color_scheme   = require 'color_scheme'

c.color_scheme       = color_scheme
c.enable_tab_bar     = false
-- c.font               = wezterm.font "geistmono nerd font"
c.font               = wezterm.font_with_fallback {
  "geistmono nerd font",
  "space mono",
  "geist mono",
}
c.font_size          = 15.5
c.window_padding     = {
  left   = 0,
  right  = 0,
  top    = 0,
  bottom = 0,
}
c.keys               = {
  -- Turn off the default CMD-m Hide action, allowing CMD-m to
  -- be potentially recognized and handled by the tab
  {
    key    = 'w',
    mods   = 'SUPER',
    action = wezterm.action.DisableDefaultAssignment,
  },
}
c.window_decorations = "NONE"
-- c.window_startup_mode = "Maximized"

-- c.font_dirs      = { '.nix-profile/share/fonts/' }

return c
