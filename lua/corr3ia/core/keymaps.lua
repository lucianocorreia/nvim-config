vim.g.mapleader = " "
vim.g.maplocalleader = ' '

local keymap = vim.keymap

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
keymap.set("i", "kjw", "<ESC>:w<CR>", { desc = "Exit insert mode with jk" })
