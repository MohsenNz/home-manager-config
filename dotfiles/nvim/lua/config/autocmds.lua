-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

local function indent(i)
  vim.bo.shiftwidth = i
  vim.bo.tabstop    = i
  vim.bo.expandtab  = true
end

local function indent_for(pattern_, indent_)
  vim.api.nvim_create_autocmd("FileType", {
    pattern  = pattern_,
    callback = indent_,
  })
end

local function indent2() indent(2) end
local function indent4() indent(4) end

local function indent2for(pattern_) indent_for(pattern_, indent2) end
local function indent4for(pattern_) indent_for(pattern_, indent4) end

-- indent2for("haskell")
indent2for("nix")
indent4for("sh") -- go, rust, python already have set (by LSP IMO)
indent4for("nginx")
