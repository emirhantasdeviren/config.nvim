vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set({'i', 'v'}, "jf", "<ESC>")
keymap.set('n', "<leader>nh", "<CMD>noh<CR>")

keymap.set('n', "<C-h>", "<C-w>h", { desc = "Move the cursor left of the current window"})
keymap.set('n', "<C-j>", "<C-w>j", { desc = "Move the cursor below the current window"})
keymap.set('n', "<C-k>", "<C-w>k", { desc = "Move the cursor above the current window"})
keymap.set('n', "<C-l>", "<C-w>l", { desc = "Move the cursor right of the current window"})
