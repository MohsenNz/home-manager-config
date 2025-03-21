vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- https://haskell-language-server.readthedocs.io/en/latest/configuration.html
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#hls
local opts = {
    filetypes = { 'haskell', 'lhaskell', 'cabal' },
    settings = {
        haskell = {
            cabalFormattingProvider = "cabalfmt",
            formattingProvider = "stylish-haskell" -- fourmolu, ormolu, stylish-haskell, none
        }
    },
}

local function find_path_of(file)
    local path = vim.fn.expand('%:p:h') -- Get the current file's directory

    while path ~= "/" do
        local files = vim.fn.globpath(path, file)
        if files ~= "" then
            return path .. "/" .. file
        end
        path = vim.fn.fnamemodify(path, ":h") -- Go to the parent directory
    end

    print("haskell.lua:yaml_to_args: Could not find file: " .. file)
    return nil
end

local function yaml_to_args(yaml_file_path)
    local file = io.open(yaml_file_path, "r")

    if not file then
        print("haskell.lua:yaml_to_args: Could not open file: " .. yaml_file_path)
        return nil
    end

    local args = {}

    for line in file:lines() do
        local x = string.gsub(line, "%s*:%s*", "=") -- " : " to "="
        local y = string.gsub(x, "#.*", "")         -- remove comment
        local z = string.gsub(y, "%s+$", "")        -- remove trailing white-space
        local arg = "--" .. z
        table.insert(args, arg)
    end

    file:close()

    return args
end

local function map_res(x, f)
    if x == nil then
        return nil
    else
        return f(x)
    end
end

-- local fourmolu_path                 = find_path_of("fourmolu.yaml")
-- local stylish_path                  = find_path_of(".stylish-haskell.yaml")
-- local is_fourmolu_and_stylish_exist = fourmolu_path ~= nil and stylish_path ~= nil

-- -- to combine fourmolu and stylish_haskell
-- if is_fourmolu_and_stylish_exist then
--     -- This will overwrite hls formatter
--     local formatters = require "lvim.lsp.null-ls.formatters"
--     formatters.setup {
--         {
--             name = "fourmolu",
--             args = map_res(find_path_of("fourmolu.yaml"), yaml_to_args)
--         },
--         {
--             name = "stylish_haskell",
--             args = { "--config", find_path_of(".stylish-haskell.yaml") }
--         }
--     }
-- end

require("lvim.lsp.manager").setup("hls", opts)
