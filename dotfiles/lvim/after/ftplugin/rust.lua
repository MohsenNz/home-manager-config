vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "rust_analyzer" })
-- check "https://rust-analyzer.github.io/manual.html#configuration"
local opts = {
    settings = {
        ["rust-analyzer"] = {
            check = {
                command = "clippy",
            },
        },
    }
}
require("lvim.lsp.manager").setup("rust_analyzer", opts)
