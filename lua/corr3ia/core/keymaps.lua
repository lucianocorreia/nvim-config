vim.g.mapleader = " "
vim.g.maplocalleader = ' '

local keymap = vim.keymap

keymap.set("i", "kj", "<ESC>", { desc = "Exit insert mode with jk" })
-- keymap.set("i", "kj", "<ESC>:w<CR>", { desc = "Exit insert mode with kj" })

-- Movement
keymap.set("n", "<C-L>", "<C-W><C-L>", { desc = "Move to the [L]eft window" })
keymap.set("n", "<C-H>", "<C-W><C-H>", { desc = "Move to the [H]ight window" })
keymap.set("n", "<C-K>", "<C-W><C-K>", { desc = "Move to the [K]ight window" })
keymap.set("n", "<C-J>", "<C-W><C-J>", { desc = "Move to the [J]ight window" })
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Move [D]own" })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Move [U]p" })
keymap.set("n", "n", "nzzzv", { desc = "Move [N]ext" })
keymap.set("n", "N", "Nzzzv", { desc = "Move [N]ext" })

-- -- Resize Window
keymap.set("n", "H", "2<C-W>>", { desc = "Resize [H]orizontal" })
keymap.set("n", "L", "2<C-W><", { desc = "Resize [L]eft" })

-- Copy Paste
-- keymap.set("n", "<leader>y", "yiw", { desc = "Copy [Y]ank word", silent = true })
keymap.set("n", "<leader>p", "viwP", { desc = "Paste in world", silent = true })

-- Move lines
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move [J] down" })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move [K] up" })
keymap.set("v", "<", "<gv", { desc = "Move [L]eft", silent = true })
keymap.set("v", ">", ">gv", { desc = "Move [R]ight", silent = true })

-- hlsearch
keymap.set("n", "<leader>hh", ":nohl<CR>", { desc = "Clear [H]ighlight", silent = true })

-- misc
keymap.set("n", "<leader>rp", ":%s/\\<<C-r><C-w>\\>//gI<Left><Left><Left>", { desc = "Replace [P]attern" })
keymap.set("n", "<C-s>", "<Cmd>w<CR>", { desc = "Save [W]rite" })


-- Go run commands
keymap.set("n", "<leader>gtf", "<Cmd>GoTestFunc<CR>", { desc = "Go [T]est [F]unction", silent = true })
keymap.set("n", "<leader>gtp", "<Cmd>GoTestFile<CR>", { desc = "Go [T]est [P]ackage", silent = true })
keymap.set("n", "<leader>gto", "<Cmd>GoCoverage<CR>", { desc = "Go [T]est [O]verage", silent = true })
keymap.set("n", "<leader>gtc", "<Cmd>GoCoverageToggle<CR>", { desc = "Go [T]est [C]overage", silent = true })
keymap.set("n", "<leader>gtb", "<Cmd>GoCoverageBrowser<CR>", { desc = "Go [T]est [B]rowser", silent = true })

keymap.set("n", "<leader>gat", "<Cmd>GoAddTags<CR>", { desc = "Go [A]dd [T]ags", silent = true })
keymap.set("n", "<leader>ger", "<Cmd>GoIfErr<CR>", { desc = "Go [E]rr [R]eport", silent = true })

-- fold
keymap.set("v", "<C-f>", ":fold<CR>", { desc = "Fold", silent = true })
keymap.set("n", "<C-f>", "<Cmd>foldopen<CR>", { desc = "Fold [O]pen", silent = true })

