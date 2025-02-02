vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

local opts = {
    settings = {
        ["nil"] = {
            formatting = {
                command = { "nixpkgs-fmt" },
            }
        },
    }
}

require("lvim.lsp.manager").setup("nil_ls", opts)
