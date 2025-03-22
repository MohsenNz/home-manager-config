-- [Read the docs]  (https://www.lunarvim.org/docs/configuration)
-- [Video Tutorials](https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6)
-- [Forum]          (https://www.reddit.com/r/lunarvim/)
-- [Discord]        (https://discord.com/invite/Xb9B4Ny)

vim.opt.tabstop        = 2
vim.opt.shiftwidth     = 2
vim.opt.expandtab      = true     -- convert tabs to spaces
vim.opt.foldmethod     = "indent" -- folding set to "expr" for treesitter based folding
vim.opt.foldexpr       = ""       -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
vim.opt.whichwrap      = ""       -- wrap to next line
vim.opt.cmdheight      = 1        -- more space in the neovim command line for displaying messages
vim.opt.clipboard      = "unnamedplus"
vim.opt.relativenumber = false
vim.opt.spell          = true
-- vim.opt.scrolloff = 4 -- scrolloff offset
-- vim.opt.sidescrolloff = 4 -- sidescrolloff offset

-- vim.opt.background     = "dark"       -- light dark
-- lvim.colorscheme       = "tokyonight" -- everforest onedark tokyonight rose-pine

lvim.format_on_save    = true

lvim.plugins           = {
    -- # Colorschemes
    { "rose-pine/neovim",                 name = "rose-pine", lazy = false },
    { "joshdick/onedark.vim" },
    { "sainnhe/everforest" },
    { "lifepillar/vim-solarized8" },
    { "folke/tokyonight.nvim",            priority = 1000,    lazy = false },
    -- etc: crusoexia/vim-monokai, tomasr/molokai, patstockwell/vim-monokai-tasty
    -- # Tools
    { "purescript-contrib/purescript-vim" },
    { "LhKipp/nvim-nu" },
    { "lifepillar/pgsql.vim" }, -- ?
    -- require("flutter-tools-p"),
    -- require("rustaceanvim-p"),
}

vim.filetype.add({
    extension = {
        purs = "purescript",
        kbd = "lisp",
        service = "systemd"
    },
})

-- # Key-mappings [view all the defaults by pressing <leader>Lk]
lvim.keys.normal_mode["<C-s>"]   = ":w<cr>"
lvim.keys.normal_mode["<A-k>"]   = ":BufferLineCycleNext<cr>"
lvim.keys.normal_mode["<A-j>"]   = ":BufferLineCyclePrev<cr>"
lvim.keys.normal_mode["<A-S-k>"] = ":BufferLineMoveNext<cr>"
lvim.keys.normal_mode["<A-S-j>"] = ":BufferLineMovePrev<cr>"

require("nvimtree-c")
require("bufferline-c")
require("lualine-c")

-- to add lvim-theme.lua created by home-manager that handles them
local home_path = os.getenv("HOME");
package.path = package.path .. ';' .. home_path .. '/.config/handle-theme/?.lua'
require("lvim-theme")
