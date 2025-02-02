vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.lsp.start({
    name = 'nushell-language-server',
    cmd = { 'nu', '--lsp' },
    autostart = true,
})

-- require("lvim.lsp.manager").setup("nushell", {}) -- use this instead when update is available
