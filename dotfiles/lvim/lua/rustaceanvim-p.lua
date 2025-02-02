-- https://github.com/mrcjkb/rustaceanvim#usage
return {
    'mrcjkb/rustaceanvim',
    version = '^4', -- Recommended
    ft = { 'rust' },
    init = function()
        -- Configure rustaceanvim here
        vim.g.rustaceanvim = {
            -- Plugin configuration
            tools = {
            },
            -- LSP configuration
            server = {
                -- on_attach = function(client, bufnr)
                --     -- you can also put keymaps in here
                --     vim.keymap.set(
                --         "n",
                --         "<leader>a",
                --         function()
                --             vim.cmd.RustLsp('codeAction') -- supports rust-analyzer's grouping
                --             -- or vim.lsp.buf.codeAction() if you don't want grouping.
                --         end,
                --         { silent = true, buffer = bufnr }
                --     )
                -- end,
                settings = {
                    -- check "https://rust-analyzer.github.io/manual.html#configuration"
                    ['rust-analyzer'] = {
                        check = {
                            command = "clippy",
                        },
                    },
                },
            },
            -- DAP configuration
            dap = {
            },
        }
    end,
}
