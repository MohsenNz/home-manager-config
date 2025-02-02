local opts             = lvim.builtin.bufferline.options

-- local STYLE            = {
--     default = 1,
--     minimal = 2,
--     no_bold = 3,
--     no_italic = 4,
-- }
-- opts.style_preset      = STYLE.minimal

opts.max_name_length   = 14
opts.max_prefix_length = 9
opts.tab_size          = 14
opts.show_buffer_icons = false
-- opts.separator_style   = "thin" -- "slope"

opts.hover.enabled     = true
opts.hover.reveal      = { "close" }

for _, item in ipairs(opts.offsets) do
    item.padding = 0
    item.highlight = "NvimTreeNormal"
    item.seperator = true
end
