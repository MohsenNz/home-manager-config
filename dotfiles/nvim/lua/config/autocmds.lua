-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

local function indent4()
  vim.bo.shiftwidth = 4
  vim.bo.tabstop    = 4
  vim.bo.expandtab  = true
end

local function set_indent4(pattern_)
  vim.api.nvim_create_autocmd("FileType", {
    pattern  = pattern_,
    callback = indent4,
  })
end

set_indent4("sh") -- go, rust, python already have set (by LSP IMO)
set_indent4("nginx")
