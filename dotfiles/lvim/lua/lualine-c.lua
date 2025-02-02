local components          = require "lvim.core.lualine.components"

local lualine             = lvim.builtin.lualine
local opts                = lualine.options
local sections            = lualine.sections

opts.component_separators = { left = '', right = '' }
opts.section_separators   = { left = '', right = '' } -- { left = '', right = '' }

sections.lualine_a        = {
    components.mode,
}
sections.lualine_b        = {
    components.branch,
}
sections.lualine_c        = {
    components.diff,
    components.python_env,
}
sections.lualine_x        = {
    components.diagnostics,
    -- components.lsp,
    components.spaces,
    components.filetype,
}
sections.lualine_y        = { components.location }
sections.lualine_z        = {
    components.progress,
}
