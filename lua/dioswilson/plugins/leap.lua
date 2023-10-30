return {
    "ggandor/leap.nvim",
    dependencies = {
        "tpope/vim-repeat",
    },
    config = function()
        -- NOTE: Maybe this should be inside "keymaps"
        -- require("leap").add_default_mappings() TODO: Configure keymaps
        vim.keymap.set({ "n", "x", "o" }, "<leader>lf", "<Plug>(leap-forward-to)", { desc = "[L]eap [F]orward to" })
        vim.keymap.set({ "n", "x", "o" }, "<leader>lb", "<Plug>(leap-backward-to)", { desc = "[L]eap [B]ackward to" })
        vim.keymap.set({ "n", "x", "o" }, "<leader>lt", "<Plug>(leap-forward-till)", { desc = "[L]eap forward [T]ill" })
        vim.keymap.set(
            { "n", "x", "o" },
            "<leader>lT",
            "<Plug>(leap-backward-till)",
            { desc = "[L]eap backward [T]ill" }
        )
        -- leap-from-window not mapped

        vim.keymap.set({ "n", "x", "o" }, "<leader>ll", function()
            require("leap").leap({ target_windows = { vim.fn.win_getid() } })
        end, { desc = "Leap bidirectional" })
    end,
}
