local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- keymap.set("n", "x", "_x")

-- remap H,M,L
keymap.del("n", "H")
keymap.del("n", "L")
keymap.set("n", "H", "H")
keymap.set("n", "L", "L")

keymap.set("n", "<C-j>", "<cmd>m .+1<cr>==", { desc = "Move Down" })
keymap.set("n", "<C-k>", "<cmd>m .-2<cr>==", { desc = "Move Up" })
-- keymap.set("i", "<C-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
-- keymap.set("i", "<C-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
-- keymap.set("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move Down" })
-- keymap.set("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move Up" })

-- Disable arrow keys in normal mode
vim.api.nvim_set_keymap("n", "<Up>", "<Nop>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Down>", "<Nop>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Left>", "<Nop>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Right>", "<Nop>", { noremap = true })

-- Disable arrow keys in insert mode
vim.api.nvim_set_keymap("i", "<Up>", "<Nop>", { noremap = true })
vim.api.nvim_set_keymap("i", "<Down>", "<Nop>", { noremap = true })
vim.api.nvim_set_keymap("i", "<Left>", "<Nop>", { noremap = true })
vim.api.nvim_set_keymap("i", "<Right>", "<Nop>", { noremap = true })

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Tabs
keymap.set("n", "te", ":tabedit")
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)

local discipline = require("craftzdog.discipline")
discipline.cowboy()
