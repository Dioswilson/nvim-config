vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
vim.keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")

--Cycle in yank ring
vim.keymap.set("n", "<C-n>", "<Plug>(YankyCycleForward)", { desc = "Cycle forward in yank ring" })
vim.keymap.set("n", "<C-p>", "<Plug>(YankyCycleBackward)", { desc = "Cycle backward in yank ring" })

-- Bring up preview
vim.keymap.set({ "n", "v" }, "<leader>yl", ":YankyRingHistory<CR>", { desc = "Show yank history" })
