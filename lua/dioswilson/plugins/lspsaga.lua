return {
    "nvimdev/lspsaga.nvim",
    config = function()
        require("lspsaga").setup({
            lightbulb = {
                enable = false,
            },
            rename = {
                keys = {

                    quit = "<esc>",
                },
            },
        })
    end,
}
