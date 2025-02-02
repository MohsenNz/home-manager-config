vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

local opts = {}

require("lvim.lsp.manager").setup("pyright", opts)
