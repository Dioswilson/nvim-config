return {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
        require("toggleterm").setup({
            open_mapping = [[<leader>t]],
            start_in_insert = true,
            -- terminal_mappings = true,
            -- insert_mappings = true, -- whether or not the open mapping applies in insert mode
            direction = "horizontal",
            close_on_exit = true, -- close the terminal window when the process exits
        })
    end,
}
