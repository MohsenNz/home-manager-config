vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

-- https://www.andersevenrud.net/neovim.github.io/lsp/configurations/dartls/
require("lvim.lsp.manager").setup("dartls", {})

-- -- https://github.com/akinsho/flutter-tools.nvim?tab=readme-ov-file#full-configuration
-- require("flutter-tools").setup {} -- use defaults
