vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "purescriptls" })

-- https://github.com/nwolverson/purescript-language-server#neovims-built-in-language-server--nvim-lspconfig
-- https://github.com/nwolverson/vscode-ide-purescript/blob/master/package.json
local opts = {
    -- on_attach=on_attach,
    settings = {
        purescript = {
            pursExe = "./node_modules/purescript/purs.bin",
            formatter = "tidy",
            exportsCodeLens = false,
        },
    }
}

require("lvim.lsp.manager").setup("purescriptls", opts)
