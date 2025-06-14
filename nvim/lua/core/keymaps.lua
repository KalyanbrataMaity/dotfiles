vim.g.mapleader = " "
local keymap = vim.keymap

keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Find files" })
