-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
local del = vim.keymap.del

local ns = function(desc_)
  return { noremap = true, silent = true, desc = desc_ }
end

-- Save
map("n", "<Space>w", "<cmd>w<cr>", ns("Save File"))
del({ "i", "x", "n", "s" }, "<C-s>")

-- Quit
map("n", "<Space>q", "<cmd>q<cr>", ns())

-- LSP
map("n", "<leader>la", "<leader>ca", { remap = true, desc = "Code Action" })
map("n", "<leader>lA", "<leader>cA", { remap = true, desc = "Source Action" })
map("n", "<leader>lc", "<leader>cc", { remap = true, desc = "Run Codelens" })
map("n", "<leader>lC", "<leader>cC", { remap = true, desc = "Refresh & Display Codelens" })
map("n", "<leader>li", "<leader>cl", { remap = true, desc = "Lsp Info" })
map("n", "<leader>lr", "<leader>cr", { remap = true, desc = "Rename" })
map("n", "<leader>ld", "<leader>cd", { remap = true, desc = "Line Diagnostics" })
map("n", "<leader>lf", "<leader>cf", { remap = true, desc = "Format" })
map("n", "<leader>lF", "<leader>cF", { remap = true, desc = "Format Injected Langs" })
map("n", "<leader>ls", "<leader>cs", { remap = true, desc = "Symbols (Trouble)" })
map("n", "<leader>lS", "<leader>cS", { remap = true, desc = "LSP references/definitions/... (Trouble)" })

-- Diagnostics
map("n", "<leader>le", "]e", { remap = true, desc = "Next Error" })
map("n", "<leader>lE", "[e", { remap = true, desc = "Prev Error" })
map("n", "<leader>lw", "]w", { remap = true, desc = "Next Warning" })
map("n", "<leader>lW", "[w", { remap = true, desc = "Prev Warning" })
map("n", "<leader>lj", "]d", { remap = true, desc = "Next Diagnostic" })
map("n", "<leader>lk", "[d", { remap = true, desc = "Prev Diagnostic" })

-- Buffers

-- local bufclose = function() Snacks.bufdelete() end

map("n", "<A-k>", "<cmd>BufferLineCycleNext<cr>", ns("Prev Buffer"))
map("n", "<A-j>", "<cmd>BufferLineCyclePrev<cr>", ns("Next Buffer"))
map("n", "<A-S-k>", "<cmd>BufferLineMoveNext<cr>", ns("Move Buffer to Next"))
map("n", "<A-S-j>", "<cmd>BufferLineMovePrev<cr>", ns("Move Buffer to Prev"))
map("n", "<leader>bl", "<cmd>BufferLineCloseRight<cr>", ns("Delete Buffers to the Right"))
map("n", "<leader>bh", "<cmd>BufferLineCloseLeft<cr>", ns("Delete Buffers to the Left"))
-- map("n", "<leader>bc", bufclose, { desc = "Close Buffer" })
-- map("n", "<leader>bC", "<cmd>bd<cr>", { desc = "Close Buffer and Window" })
del("n", "<S-h>")
del("n", "<S-l>")
del("n", "<leader>br") -- Delete Buffers to the Right
-- del("n", "<leader>bd") -- Delete Buffer
-- del("n", "<leader>bD") -- Delete Buffer and Window
del("n", "<leader>,") -- Show Buffers
del("n", "<leader>.") -- Toggle Scratch Buffer
del("n", "<leader>S") -- Sellect Scratch Buffer

-- Flash
local flash_jump = function() require("flash").jump() end
map({ "n", "x", "o" }, "f", flash_jump, { desc = "Flash Jump" })

-- Git
map("n", "<leader>gb", "<leader>ghb", { remap = true, desc = "Blame Line Hunk" })
map("n", "<leader>gL", Snacks.picker.git_log_line, { desc = "Blame Line" })

-- Move Lines Disable
del("n", "<leader>`")
del("n", "<leader>bb")
del({ "i", "v" }, "<A-j>")
del({ "i", "v" }, "<A-k>")

-- Commenting
map("n", "<leader>/", "<cmd>normal gcc<cr>", { desc = "Comment toggle line" })
map("v", "<leader>/", "<cmd>normal gc<cr>", { desc = "Comment toggle selection" })
del("n", "gco") -- Add Comment Below
del("n", "gcO") -- Add Comment Above

-- Tabs
del("n", "<leader><tab>l")
del("n", "<leader><tab>o")
del("n", "<leader><tab>f")
del("n", "<leader><tab><tab>")
del("n", "<leader><tab>]")
del("n", "<leader><tab>d")
del("n", "<leader><tab>[")

-- Others
del("n", "<leader>K")
del("n", "<leader>?")
map("n", "q", "<Nop>") -- Disable q recording
del("n", "<leader>l")  -- changed to <leader>z
map("n", "<leader>z", "<cmd>Lazy<cr>", { desc = "Lazy" })
