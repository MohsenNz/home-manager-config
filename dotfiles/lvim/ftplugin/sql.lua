vim.opt.tabstop = 4
vim.opt.shiftwidth = 4


local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
    { name = "sqlfluff" },
}

local conf_path = vim.fs.dirname(vim.api.nvim_buf_get_name(0)) .. "/.sqlfluff"

local helpers = require("null-ls.helpers")
local FORMATTING = require("null-ls.methods").internal.FORMATTING
require("null-ls").register({
    helpers.make_builtin({
        name = "sqlfluff-formatter",
        method = FORMATTING,
        filetypes = { "sql" },
        generator_opts = {
            command = "sqlfluff",
            args = { "fix", "--config", conf_path, "-" }, -- put any required arguments in this table
            to_stdin = true,                              -- instructs the command to ingest the file from STDIN (i.e. run the currently open buffer through the linter/formatter)
        },
        factory = helpers.formatter_factory,
    })
})

-- local y = vim.fs.find('.sqlfluff', {
--     upward = true,
--     stop = vim.loop.os_homedir(),
--     path = vim.fs.dirname(vim.api.nvim_buf_get_name(0)),
-- })

-- require("lvim.lsp.manager").setup("sqlls", {})
-- require("lvim.lsp.manager").setup("sqls", {})
