require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Control - s = Save File (Insert / Visual Modes)
map({ "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Control - s = Move line down (Normal Mode)
map({ "n" }, "<C-s>", "<cmd> m +1 <cr>")

-- Control - s = Move line up (Normal Mode)
map({ "n" }, "<C-w>", "<cmd> m -2 <cr>")
