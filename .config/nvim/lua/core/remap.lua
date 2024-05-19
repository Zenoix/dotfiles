vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", "<CMD>Oil<CR>")
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Allows moving of lines using J or K when selected
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keep cursor still when connecting lines to the end of previous lines
vim.keymap.set("n", "J", "mzJ`z")

-- Keep cursor in the middle of screen when jumping around page
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- When pasting over something, keep the original thing in the clipboard
vim.keymap.set("x", "<leader>p", '"_dP')

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Change terminal emulator normal mode key to esc
vim.keymap.set("t", "<leader><Esc>", "<C-\\><C-n>")
