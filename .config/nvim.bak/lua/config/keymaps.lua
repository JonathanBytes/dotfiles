-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Disable default keybind
vim.keymap.del("n", "<leader>/")

-- Spelling binds
vim.keymap.set("n", "<leader>mss", function()
  vim.cmd("normal! 1z=")
end, { desc = "[P] Spelling suggest" })
vim.keymap.set("n", "<leader>msl", function()
  vim.cmd("normal! z=")
end, { desc = "[P] Spelling suggestion list" })

-- Copy all content of the file to clipboard with ctrl + a
vim.keymap.set("n", "<C-a>", ":%y+<cr>", { noremap = true, silent = true, desc = "Copy all buffer into clipboard" })
