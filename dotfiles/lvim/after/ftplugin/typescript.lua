vim.opt.tabstop    = 2
vim.opt.shiftwidth = 2

require("lvim.lsp.manager").setup("tsserver", {
    -- on_attach = function(client, bufnr)
    --     -- Disable tsserver formatting, so Prettier handles it
    --     client.server_capabilities.documentFormattingProvider = false
    -- end,
})

-- local formatters   = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--     {
--         name = "prettier",

--         ---@usage only start in these filetypes, by default it will attach to all filetypes it supports
--         filetypes = { "typescriptreact", "typescript", "javascript" },

--         ---@usage arguments to pass to the formatter
--         -- these cannot contain whitespace
--         -- options such as `--line-width 80` become either `{"--line-width", "80"}` or `{"--line-width=80"}`
--         -- args = { "--print-width", "100" },
--     },
-- }

-- local opts         = {
--     --- ...
--     on_attach = function(client, bufnr)
--         vim.api.nvim_create_autocmd("BufWritePre", {
--             buffer = bufnr,
--             command = "EslintFixAll",
--         })
--     end,
-- }

-- require("lvim.lsp.manager").setup("eslint", opts)

-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--     { name = "eslint" },
--     -- {
--     --     name = "shellcheck",
--     --     args = { "--severity", "warning" },
--     -- },
-- }

-- local code_actions = require "lvim.lsp.null-ls.code_actions"
-- code_actions.setup {
--     {
--         name = "proselint",
--     },
-- }
