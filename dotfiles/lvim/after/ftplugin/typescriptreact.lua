vim.opt.tabstop    = 2
vim.opt.shiftwidth = 2

require("lvim.lsp.manager").setup("tsserver", {})
