-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>n", "<cmd>NerdIcons<cr>", { desc = "Open NerdIcons" })
vim.keymap.set({ "n", "v" }, "<C-p>", '"*p', { desc = "Paste from selection clipboard" })
vim.keymap.set({ "n", "v" }, "p", '"+p', { desc = "Paste from system clipboard" })
vim.keymap.set(
  { "v", "n" },
  "<leader>t",
  "<cmd>TSBufToggle highlight<cr>",
  { desc = "Toggle Tree-sitter highlighting" }
)
vim.keymap.set("n", "<leader>z", ":!zathura <C-r>=expand('%:r')<cr>.pdf &<cr>", { desc = "Open PDF" })
