vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

require("lvim.lsp.manager").setup("gopls", {})

local formatters = require "lvim.lsp.null-ls.formatters"

formatters.setup {
    {
        name = "gofmt",
    },
}
