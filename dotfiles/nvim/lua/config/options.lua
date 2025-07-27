-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.snacks_animate   = true
vim.opt.relativenumber = false
vim.opt.shiftwidth     = 2
vim.opt.tabstop        = 2
vim.opt.expandtab      = true -- convert tabs to spaces
vim.opt.spell          = true
-- vim.opt.foldmethod     = "indent" -- folding set to "expr" for treesitter based folding
-- vim.opt.foldexpr       = ""       -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
vim.opt.scrolloff      = 8                                -- scrolloff offset
vim.opt.sidescrolloff  = 8                                -- sidescrolloff offset
vim.opt.background     = require("nvim-theme").background -- light | dark

vim.filetype.add({
  extension = {
    purs    = "purescript",
    kbd     = "lisp",
    service = "systemd",
  },
})
