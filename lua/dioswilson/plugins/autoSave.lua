return {
    "Pocco81/auto-save.nvim",
    config = function()
        require("auto-save").setup({
            debounce_delay = 1500, --saves every 1500 ms, maybe change this
        })
    end,
}
