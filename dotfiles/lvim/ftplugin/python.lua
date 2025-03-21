vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

local opts = {}

require("lvim.lsp.manager").setup("pyright", opts)

-- local formatters = require "lvim.lsp.null-ls.formatters"

-- formatters.setup {
--     { name = "black" },
-- }
