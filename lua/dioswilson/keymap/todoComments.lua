vim.keymap.set("n", "<leader>nc", function()
    require("todo-comments").jump_next()
end, { desc = "[N]ext TODO [c]omment" })

vim.keymap.set("n", "<leader>pc", function()
    require("todo-comments").jump_prev()
end, { desc = "[P]revious TODO [c]omment" })
